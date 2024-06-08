import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';
import 'login_material.dart';
import 'login_cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (UniversalPlatform.isAndroid) {
      return MaterialApp(
        home: LoginPageMaterial(),
      );
    } else if (UniversalPlatform.isWeb) {
      return MaterialApp(
        home: LoginPageCupertinoWrapper(),
      );
    } else {
      return MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text('Platform not supported'),
          ),
        ),
      );
    }
  }
}

class LoginPageCupertinoWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LoginPageCupertino(),
      ),
    );
  }
}
