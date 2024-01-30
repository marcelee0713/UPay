import 'package:citefest/models/student_card.dart';
import 'package:citefest/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<StudentCardRes> apiStudentCard({required String uid}) async {
  try {
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (!documentSnapshot.exists) {
      throw Exception("User data does not exist!");
    }

    UserModel obj = UserModel.fromSnapshot(documentSnapshot);
    StudentCardModel data = StudentCardModel(
        studentNumber: obj.studentNumber, balance: obj.balance);
    StudentCardRes res = StudentCardRes(studentCardRes: data);

    return res;
  } catch (err) {
    if (err is FirebaseException) {
      return StudentCardRes(errorMessage: err.message);
    }

    return StudentCardRes(errorMessage: err.toString());
  }
}
