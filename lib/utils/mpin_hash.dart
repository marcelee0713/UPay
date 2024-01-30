import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

String generateSalt() {
  final random = Random.secure();
  List<int> saltBytes = List.generate(16, (index) => random.nextInt(256));
  return base64Url.encode(saltBytes);
}

String hashMPIN(String password, String salt) {
  final key = utf8.encode(password);
  final hmac = Hmac(sha256, key);

  List<int> saltBytes = base64Url.decode(salt);
  final digest = hmac.convert(saltBytes);

  return base64Url.encode(digest.bytes);
}

bool verifyMPIN(
    String providedMPIN, String storedSalt, String storedHashedMPIN) {
  String hashToCheck = hashMPIN(providedMPIN, storedSalt);
  return hashToCheck == storedHashedMPIN;
}
