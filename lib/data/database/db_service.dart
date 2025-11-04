import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expenpay/data/models/transaction_model.dart';

const String ref = "transactions";

class DbService {
  final _firestore = FirebaseFirestore.instance;
  late final CollectionReference _transactionsRef;
  DbService() {
    _transactionsRef = _firestore
        .collection(ref)
        .withConverter<TransactionModel>(
          fromFirestore: (snapshot, _) =>
              TransactionModel.fromJson(snapshot.data()!),
          toFirestore: (transactionModel, _) => transactionModel.toJson(),
        );
  }
  Stream<QuerySnapshot> getTransactions() {
    return _transactionsRef.orderBy('date', descending: true).snapshots();
  }

  Future<void> addTransaction(TransactionModel transaction) {
    return _transactionsRef.add(transaction);
  }
}
