import 'package:ton_dart/src/boc/cell/cell.dart';
import 'package:ton_dart/src/contracts/core/contract.dart';
import 'package:ton_dart/src/contracts/wallet/core/version.dart';
import 'package:ton_dart/src/contracts/wallet/models/versioned_wallet_account_params.dart';
import 'package:ton_dart/src/contracts/wallet/provider/provider_impl.dart';
import 'package:ton_dart/src/contracts/wallet/transaction/transaction_impl.dart';
import 'package:ton_dart/src/contracts/wallet/utils/utils.dart';
import 'package:ton_dart/src/crypto/keypair/private_key.dart';
import 'package:ton_dart/src/models/models/message.dart';
import 'package:ton_dart/src/models/models/message_relaxed.dart';
import 'package:ton_dart/src/models/models/send_mode.dart';
import 'package:ton_dart/src/models/tx_requests/tx_response.dart';
import 'package:ton_dart/src/provider/provider.dart';

typedef OnEstimateFee = Future<void> Function(Message message);

abstract class VersonedWalletContract
    extends TonContract<VersionedWalletAccountPrams> {
  const VersonedWalletContract();
  abstract final WalletVersion type;
  Future<TxResponse> sendTransfer(
      {required List<MessageRelaxed> messages,
      required TonPrivateKey privateKey,
      required TonProvider rpc,
      SendMode sendMode = SendMode.payGasSeparately,
      int? timeout,
      OnEstimateFee? onEstimateFee});

  @override
  Cell code(int workchain) {
    return type.getCode();
  }

  @override
  Cell data(VersionedWalletAccountPrams params, int workchain) {
    return VersionedWalletUtils.buldData(
        type: type, publicKey: params.publicKey, subWalletId: params.subwallet);
  }
}

abstract class WalletContract extends VersonedWalletContract
    with VersionedWalletTransactionImpl, VerionedProviderImpl {
  const WalletContract();
}
