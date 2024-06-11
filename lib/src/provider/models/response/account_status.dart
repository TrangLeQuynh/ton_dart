class AccountStatusResponse {
  final String _value;

  const AccountStatusResponse._(this._value);

  static const AccountStatusResponse nonexist =
      AccountStatusResponse._("nonexist");
  static const AccountStatusResponse uninit = AccountStatusResponse._("uninit");
  static const AccountStatusResponse active = AccountStatusResponse._("active");
  static const AccountStatusResponse frozen = AccountStatusResponse._("frozen");

  static const List<AccountStatusResponse> values = [
    nonexist,
    uninit,
    active,
    frozen,
  ];

  String get value => _value;

  bool get isActive => this != uninit;

  static AccountStatusResponse fromName(String? name) {
    if (name == "uninitialized") return AccountStatusResponse.uninit;
    return values.firstWhere(
      (element) => element.value == name,
      orElse: () => throw Exception(
          "No AccountStatusResponse found with the provided name: $name"),
    );
  }
}
