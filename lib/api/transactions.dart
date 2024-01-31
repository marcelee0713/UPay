import 'package:citefest/models/transactions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<TransactionsRes?> apiGetTransactions({required String uid}) async {
  List<TransactionModel> list = [];
  try {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('transactions').get();

    List<QueryDocumentSnapshot> documents = querySnapshot.docs;
    for (var document in documents) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;

      TransactionModel obj = TransactionModel.fromJson(data);

      if (obj.uid == uid) list.add(obj);
    }

    return TransactionsRes(list: list);
  } catch (err) {
    if (err is FirebaseException) {
      return TransactionsRes(errorMessage: "Error: ${err.message}", list: []);
    }

    return TransactionsRes(errorMessage: "Error: ${err.toString()}", list: []);
  }
}

class TransactionsRes {
  List<TransactionModel> list;
  String? errorMessage;

  TransactionsRes({required this.list, this.errorMessage});
}
