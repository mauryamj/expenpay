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

  TransactionModel.fromJson(Map<String, Object?> json)
    : this(
        name: json["name"]! as String,
        amount: (json["amount"] as num).toDouble(),
        date: json["date"]! as Timestamp,
        category: json["category"]! as String,
      );

  TransactionModel copyWith({
    String? name,
    double? amount,
    Timestamp? date,
    String? category,
  }) {
    return TransactionModel(
      name: name ?? this.name,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      category: category ?? this.category,
    );
  }

  Map<String, Object?> toJson() {
    return {"name": name, "amount": amount, "date": date, "category": category};
  }
}
