class SignRawMessage {
  //address (string): message destination in user-friendly format
  String address;

  //amount (decimal string): number of nanocoins to send.
  BigInt amount;

  //payload (string base64, optional): raw one-cell BoC encoded in Base64.
  String? payload;

  //stateInit (string base64, optional): raw once-cell BoC encoded in Base64.
  String? stateInit;

  SignRawMessage({
    required this.address,
    required this.amount,
    required this.payload,
    required this.stateInit,
  });

  factory SignRawMessage.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return SignRawMessage(
      address: json['address'],
      amount: BigInt.parse(json['amount'].toString()),
      payload: json['payload'] ?? '',
      stateInit: json['stateInit'] ?? [],
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'address': address,
    'amount': amount,
    'payload': payload,
    'stateInit-type': stateInit,
  };
}
