import 'package:ton_dart/src/address/address/address.dart';
import 'package:ton_dart/src/contracts/wallet/core/version.dart';
import 'package:ton_dart/src/models/models/state_init.dart';
import 'package:ton_dart/src/provider/provider.dart';
import 'package:ton_dart/src/contracts/wallet/core/versioned_wallet.dart';
import 'package:ton_dart/src/contracts/wallet/utils/utils.dart';
import 'package:ton_dart/src/contracts/wallet/provider/provider_impl.dart';

/// This version introduces the valid_until parameter which is used to set a time limit for a
/// transaction in case you don't want it to be confirmed too late. This version also doesn't
/// have the get-method for public key, which is added in V2R2.
/// It can be used in most cases, but it misses one cool feature, which was added in V3.
/// https://docs.ton.org/participate/wallets/contracts
class WalletV2R1 extends WalletContract {
  @override
  final StateInit state;

  @override
  final TonAddress address;

  const WalletV2R1._({required this.state, required this.address});

  factory WalletV2R1({required int workChain, required List<int> publicKey}) {
    final state = VersionedWalletUtils.buildState(
        publicKey: publicKey, type: WalletVersion.v2R1);
    return WalletV2R1._(
        state: state,
        address: TonAddress.fromState(state: state, workChain: workChain));
  }
  static Future<WalletV2R1> fromAddress(
      {required TonAddress address, required TonApiProvider rpc}) async {
    final data =
        await VerionedProviderImpl.getStateStatic(rpc: rpc, address: address);
    final state = VersionedWalletUtils.buildFromAddress(
        address: address, stateData: data.data, type: WalletVersion.v2R1);
    return WalletV2R1._(state: state.item1, address: address);
  }

  @override
  WalletVersion get type => WalletVersion.v2R1;

  @override
  int? get subWalletId => null;
}