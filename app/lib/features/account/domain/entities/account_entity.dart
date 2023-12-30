class AccountEntity {
  String accountNumber;
  String accountName;

  AccountEntity({required this.accountNumber, required this.accountName});

  factory AccountEntity.fromJson(Map<String, dynamic> json) {
    return AccountEntity(
      accountNumber: json['account_number'] as String,
      accountName: json['account_name'] as String,
    );
  }
}
