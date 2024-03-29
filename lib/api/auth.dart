import 'package:citefest/models/user.dart';
import 'package:citefest/utils/mpin_hash.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthResult {
  UserCredential? userCredential;
  String? errorMessage;

  AuthResult({this.userCredential, this.errorMessage});
}

Future<AuthResult> createAccAPI({
  required UserModel user,
  required String password,
}) async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: user.email, password: password);

    if (userCredential.user == null) {
      throw Exception("Failed to create an account!");
    }

    String uid = userCredential.user!
        .uid; // This doesn't make anny sense, since I already fucking checked the availability of this value.

    await db.collection("users").doc(uid).set(user.toJson());

    return AuthResult(userCredential: userCredential);
  } on FirebaseAuthException catch (err) {
    return AuthResult(errorMessage: "Auth Error: ${err.message}");
  } catch (err) {
    if (err is FirebaseException) {
      return AuthResult(errorMessage: "Error: ${err.message}");
    }

    return AuthResult(errorMessage: "Error: ${err.toString()}");
  }
}

Future<AuthResult> signIn(
    {required String email, required String password}) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return AuthResult(userCredential: userCredential);
  } on FirebaseAuthException catch (err) {
    return AuthResult(errorMessage: firebaseAuthString(err.code));
  } catch (err) {
    return AuthResult(errorMessage: "Error: ${err.toString()}");
  }
}

User? getUser() {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = auth.currentUser;

  return user;
}

Future<String?> apiVerifyMPIN(
    {required String? uid, required String mpinput}) async {
  if (uid == null) return null;

  try {
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (!documentSnapshot.exists) throw Exception("Error"); // Idk man.

    UserModel obj = UserModel.fromSnapshot(documentSnapshot);
    if (verifyMPIN(mpinput, obj.salt, obj.mpin)) return obj.name;
    return null;
  } catch (err) {
    return null;
  }
}

String firebaseAuthString(String code) {
  switch (code) {
    case "user-disabled":
      return "You are currently disabled!";
    case "user-not-found":
      return "User not found!";
    case "invalid-email":
    case "invalid-credential":
    case "ERROR_WRONG_PASSWORD":
    case "wrong-password":
      return "Wrong credentials!";
    case "too-many-requests":
      return "Too many request already! Comeback later.";
    default:
      return "Something went wrong! $code";
  }
}
