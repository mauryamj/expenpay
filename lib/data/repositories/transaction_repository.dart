import 'package:expenpay/data/models/transaction_model.dart';

class TransactionRepository {
  final List<TransactionModel> _transactions = [
    TransactionModel(
      name: "bantu hary",
      amount: 2000,
      type: "income",
      date: DateTime.now(),
      category: "freelance",
      image: "assets/images/people/u1.jpg",
    ),
    TransactionModel(
      name: "YouTube Ad",
      amount: 245,
      type: "expense",
      date: DateTime.now(),
      category: "Entertainment",
      image: "assets/images/people/u2.jpg",
    ),
  ];
  List<TransactionModel> getAllTransactions() => _transactions;
  void addTransaction(TransactionModel transaction) {
    _transactions.add(transaction);
  }

  double get totalIncome => _transactions
      .where((t) => t.type == "income")
      .fold(0, (sum, t) => sum + t.amount);

  double get totalExpense => _transactions
      .where((t) => t.type == "expense")
      .fold(0, (sum, t) => sum + t.amount);

  double get balance => totalIncome - totalExpense;
}
