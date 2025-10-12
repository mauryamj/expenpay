class TransactionModel {
  final String name;
  final double amount;
  final String type;
  final DateTime date;
  final String category;
  final String image;

  TransactionModel({
    required this.name,
    required this.amount,
    required this.type,
    required this.date,
    required this.category,
    required this.image,
  });
  Map<String, dynamic> toJson() => {
    "name": name,
    "amount": amount,
    "type": type,
    "date": date.toIso8601String(),
    "category": category,
    "image": image,
  };

  factory TransactionModel.fromjson(Map<String, dynamic> json) {
    return TransactionModel(
      name: json["name"],
      amount: (json["amount"] as num).toDouble(),
      type: json["type"],
      date: DateTime.parse(json["date"]),
      category: json["category"],
      image: json["image"],
    );
  }
}
