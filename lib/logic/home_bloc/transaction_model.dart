import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModel {
  final String name;
  final num amount;
  final Timestamp date;
  final String category;

  TransactionModel({
    required this.name,
    required this.amount,
    required this.date,
    required this.category,
  });

  factory TransactionModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return TransactionModel(
      name: data['name'] ?? '',
      amount: data['amount'] ?? 0,
      date: data['date'] ?? Timestamp.now(),
      category: data['category'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'amount': amount, 'date': date, 'category': category};
  }
}
