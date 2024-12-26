class TxResponse {
  String hash;
  String boc;

  TxResponse({ required this.boc, required this.hash });

  Map<String, dynamic> toJson() => <String, dynamic>{
    'hash': hash,
    'boc': boc,
  };
}
