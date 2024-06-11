import 'package:ton_dart/src/provider/core/core.dart';
import 'package:ton_dart/src/provider/core/methods.dart';

/// SendBlockchainMessage invokes sendBlockchainMessage operation.
///
/// Send message to blockchain.
/// both a single boc and a batch of boc serialized in base64 are accepted
class TonApiSendBlockchainMessage
    extends TonApiPostRequestParam<Null, Map<String, dynamic>> {
  final String? boc;
  final List<String> batch;
  TonApiSendBlockchainMessage({required this.batch, this.boc});

  @override
  Object get body => {
        "boc": boc,
        "batch": batch,
      };

  @override
  String get method => TonApiMethods.sendblockchainmessage.url;
}