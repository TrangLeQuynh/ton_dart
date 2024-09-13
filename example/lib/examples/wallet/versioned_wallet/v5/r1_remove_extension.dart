import 'package:example/examples/wallet/test_wallet.dart';
import 'package:ton_dart/ton_dart.dart';

void main() async {
  final TestWallet<WalletV5R1> wallet = TestWallet(version: WalletVersion.v5R1);
  final TestWallet<WalletV5R1> newExtention =
      TestWallet(version: WalletVersion.v5R1, index: 12);
  await wallet.wallet.sendTransfer(
      params: VersionedV5TransferParams.external(
          signer: wallet.signer,
          messages: [OutActionRemoveExtension(newExtention.address)]),
      rpc: wallet.rpc);
}