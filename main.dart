import 'package:flutter/material.dart';
import './AES.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: RaisedButton(
            child: Text('baka'),
            onPressed: () {
              var x = AES.cryptoJsEncrypt(
                  data: 'baka', passpharse: 'abcdefghijuklmno0123456789012345');
              print('Encrypted data: ' + x);
            },
          ),
        ),
      ),
    );
  }
}
