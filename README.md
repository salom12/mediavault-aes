### Mediavault AES Class

AES encode function used for encrypting post request data in mediavault

### example usage
``` dart

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
              var x = AES.Encrypt(
                  data: 'baka', passpharse: 'abcdefghijuklmno0123456789012345');
              print('Encrypted data: ' + x);
            },
          ),
        ),
      ),
    );
  }
}


```


### Package dependencies
in your `pubspec.yaml` add:
``` yaml
dependencies:
  encrypt: ^3.3.1

```
