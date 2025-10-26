import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expenpay/data/models/transaction_model.dart';

class TransactionRepository {
  final List<TransactionModel> _transactions = [
    TransactionModel(
      name: "bantu hary",
      amount: 2000,
      date: Timestamp.now(),
      category: "freelance",
    ),
    TransactionModel(
      name: "YouTube Ad",
      amount: 245,
      date: Timestamp.now(),
      category: "Entertainment",
    ),
  ];
  List<TransactionModel> getAllTransactions() => _transactions;
  void addTransaction(TransactionModel transaction) {
    _transactions.add(transaction);
  }
}
