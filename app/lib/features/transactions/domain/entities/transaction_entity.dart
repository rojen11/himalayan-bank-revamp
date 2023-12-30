import 'package:app/features/account/domain/entities/account_entity.dart';

class TransactionEntity {
  int id;
  AccountEntity destinationAccount;
  DateTime transactionDate;
  double amount;
  bool debited;

  TransactionEntity(
      {required this.id,
      required this.destinationAccount,
      required this.transactionDate,
      required this.amount,
      required this.debited});

  factory TransactionEntity.fromJson(Map<String, dynamic> json) {
    return TransactionEntity(
      id: json['id'] as int,
      destinationAccount: AccountEntity.fromJson(json['destination_account']),
      transactionDate: DateTime.parse(json['transaction_date']),
      amount: json['amount'] as double,
      debited: json['debited'] as bool,
    );
  }
}
