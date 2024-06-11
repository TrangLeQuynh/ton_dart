import 'package:ton_dart/src/address/address/address.dart';
import 'package:ton_dart/src/contracts/wallet/core/version.dart';
import 'package:ton_dart/src/models/models/state_init.dart';
import 'package:ton_dart/src/provider/provider.dart';
import 'package:ton_dart/src/contracts/wallet/core/versioned_wallet.dart';
import 'package:ton_dart/src/contracts/wallet/utils/utils.dart';
import 'package:ton_dart/src/contracts/wallet/provider/provider_impl.dart';

/// This is the simplest one. It only allows you to send one transaction at
/// the time and it doesn't check anything besides your signature and seqno.
/// This version isn't even used in regular apps because it has some major issues:
/// No easy way to retrieve the seqno and public key from the contract
/// No valid_until check, so you can't be sure that the transaction won't be confirmed too late.
/// The first issue is fixed in V1R2 and V1R3. That R letter means revision. Usually revisions are just small updates which only add get-methods which allows you to retrieve seqno and public key from the contract. But this version also has a second issue, which is fixed in the next version.
/// https://docs.ton.org/participate/wallets/contracts
class WalletV1R3 extends WalletContract {
  @override
  final StateInit state;

  @override
  final TonAddress address;

  const WalletV1R3._({required this.state, required this.address});

  factory WalletV1R3({required int workChain, required List<int> publicKey}) {
    final state = VersionedWalletUtils.buildState(
        publicKey: publicKey, type: WalletVersion.v1R3);
    return WalletV1R3._(
        state: state,
        address: TonAddress.fromState(state: state, workChain: workChain));
  }
  static Future<WalletV1R3> fromAddress(
      {required TonAddress address, required TonApiProvider rpc}) async {
    final data =
        await VerionedProviderImpl.getStateStatic(rpc: rpc, address: address);
    final state = VersionedWalletUtils.buildFromAddress(
        address: address, stateData: data.data, type: WalletVersion.v1R3);
    return WalletV1R3._(state: state.item1, address: address);
  }

  @override
  WalletVersion get type => WalletVersion.v1R3;

  @override
  int? get subWalletId => null;
}
