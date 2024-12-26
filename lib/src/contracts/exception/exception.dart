import 'package:ton_dart/src/exception/exception.dart';

class TonContractException extends TonDartPluginException {
  TonContractException(String message, {Map<String, dynamic>? details})
      : super(message, details: details);
}

class TonContractDeployedException extends TonDartPluginException {
  TonContractDeployedException(String message, {Map<String, dynamic>? details})
      : super(message, details: details);
}
