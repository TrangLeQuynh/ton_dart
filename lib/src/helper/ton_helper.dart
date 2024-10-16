import 'package:blockchain_utils/utils/utils.dart';
import 'package:ton_dart/src/boc/boc.dart';
import 'package:ton_dart/src/exception/exception.dart';
import '../address/address.dart';
import '../models/models/state_init.dart';

abstract class OpCodes {
  static const JETTON_TRANSFER = 0xf8a7ea5;
  static const NFT_TRANSFER = 0x5fcc3d14;
  static const STONFI_SWAP = 0x25938561;
  static const JETTON_BURN = 0x595f07bc;
}

class TonHelper {
  static const int nanoDecimalPlaces = 9;
  static final BigRational _nanoDecimal =
      BigRational(BigInt.from(10).pow(nanoDecimalPlaces));

  /// Example  toNano("1.0") = 1000000000
  static BigInt toNano(String ton) {
    final parse = BigRational.parseDecimal(ton);
    return (parse * _nanoDecimal).toBigInt();
  }

  /// Example  fromNano(BigInt.from(1000000000)) = "1"
  static String fromNano(BigInt nanotons) {
    final parse = BigRational(nanotons);
    return (parse / _nanoDecimal).toDecimal(digits: nanoDecimalPlaces);
  }

  static Cell? tryToCell(String? data) {
    try {
      if (data?.trim().isEmpty ?? true) return null;
      if (StringUtils.isHexBytes(data!)) {
        return Cell.fromBytes(BytesUtils.fromHexString(data));
      }
      return Cell.fromBase64(data);
    } catch (e) {
      return null;
    }
  }

  static Cell toCell(String? data) {
    final toCell = tryToCell(data);
    if (toCell == null) {
      throw TonDartPluginException("Invalid cell data.",
          details: {"data": data});
    }
    return toCell;
  }

  static Cell buildMessageBody(String? memo) {
    if (memo != null) {
      return beginCell().storeUint(0, 32).storeStringTail(memo).endCell();
    }
    return Cell.empty;
  }

  static String? decodePayload(Cell data) {
    try {
      final slice = data.beginParse();
      final opCode = slice.loadUint(32);
      return BocUtils.readString(slice);
    } catch(e) {
      return null;
    }
  }

  static String? decodeMessage(String? data) {
    try {
      Cell payload = TonHelper.toCell(data);
      final slice = payload.beginParse();
      final op = slice.loadUint(32);
      if (op == OpCodes.JETTON_TRANSFER) {
        if (slice.remainingRefs > 0) {
          Cell forwardCell = slice.loadRef();
          return TonHelper.decodePayload(forwardCell);
        }
        return '';
      }
      if (op == OpCodes.NFT_TRANSFER || op == OpCodes.STONFI_SWAP) return null;
      return BocUtils.readString(slice);
    } catch(e) {
      return null;
    }
  }

  static Cell rebuildBodyWithCustomExcessesAccount(Cell payload, [ String customExcessesAccount = '']) {
    if (customExcessesAccount.isEmpty) return payload;
    //customExcessesAccount = tk.wallet.battery.excessesAccount
    final slice = payload.beginParse();
    final opCode = slice.loadUint(32);
    var builder = beginCell();

    switch(opCode) {
      case OpCodes.STONFI_SWAP:
        builder = builder
            .storeUint(OpCodes.STONFI_SWAP, 32)
            .storeAddress(slice.loadAddress())
            .storeCoins(slice.loadCoins())
            .storeAddress(slice.loadAddress());

        if (slice.loadBoolean()) {
          slice.loadAddress();
        }
        return builder
            .storeBit(1)
            .storeAddress(TonAddress(customExcessesAccount))
            .endCell();
      case OpCodes.NFT_TRANSFER:
        builder = builder
            .storeUint(OpCodes.NFT_TRANSFER, 32)
            .storeUint(slice.loadUint(64), 64)
            .storeAddress(slice.loadAddress());

        slice.loadMaybeAddress();

        while (slice.remainingRefs > 0) {
          builder = builder.storeRef(slice.loadRef());
        }
        return builder
            .storeAddress(TonAddress(customExcessesAccount))
            .storeBits(slice.loadBits(slice.remainingBits))
            .endCell();
      case OpCodes.JETTON_TRANSFER:
        builder = builder
            .storeUint(OpCodes.JETTON_TRANSFER, 32)
            .storeUint(slice.loadUint(64), 64)
            .storeCoins(slice.loadCoins())
            .storeAddress(slice.loadAddress());

        slice.loadMaybeAddress();

        while (slice.remainingRefs > 0) {
          final forwardCell = slice.loadRef();

          // recursively rebuild forward payloads
          builder = builder.storeRef(
              rebuildBodyWithCustomExcessesAccount(forwardCell, customExcessesAccount)
          );
        }

        return builder
            .storeAddress(TonAddress(customExcessesAccount))
            .storeBits(slice.loadBits(slice.remainingBits))
            .endCell();
      default:
        return payload;
    }
  }

  static StateInit? parseStateInit(String? stateInit) {
    try {
      if (stateInit == null || stateInit.isEmpty) return null;
      return StateInit.deserialize(Cell.fromBase64(stateInit).beginParse());
    } catch(e) {
      return null;
    }
  }
}
