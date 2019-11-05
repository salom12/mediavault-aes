import 'dart:typed_data';
import 'package:encrypt/encrypt.dart' as encryptLib;
import 'dart:convert';
import 'package:crypto/crypto.dart';

class AES {
  static String Encrypt({String data, String passpharse}) {
    try {
      var salt = [1, 2, 3, 4, 5, 6, 7, 8];

      List<int> salted = [];
      List<int> dx = [];
      while (salted.length < 48) {
        dx = generateMd5(dx + utf8.encode(passpharse) + salt.toList());
        salted = salted + dx;
      }

      var key = salted.sublist(0, 32);
      var iv = salted.sublist(32);

      // encrypt part
      final kkey = encryptLib.Key(Uint8List.fromList(key));
      final iiv = encryptLib.IV(Uint8List.fromList(iv));

      final encrypter = encryptLib.Encrypter(
          encryptLib.AES(kkey, mode: encryptLib.AESMode.cbc));
      final encrypted = encrypter.encrypt(
        data,
        iv: iiv,
      );
      var aesEncode = encrypted.bytes;
      String encoded = base64
          .encode(utf8.encode("Salted__") + salt.toList() + aesEncode.toList());
      return encoded;
    } catch (e) {
      return '';
    }
  }


  static List<int> generateMd5(List<int> input) {
    return md5.convert(input).bytes;
  }
}

