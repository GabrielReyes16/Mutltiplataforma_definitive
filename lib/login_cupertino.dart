import 'package:flutter/cupertino.dart';

class LoginPageCupertino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Login'),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login', style: TextStyle(fontSize: 24)),
            CupertinoTextField(
              placeholder: 'Username',
            ),
            SizedBox(height: 16),
            CupertinoTextField(
              placeholder: 'Password',
              obscureText: true,
            ),
            SizedBox(height: 20),
            CupertinoButton.filled(
              onPressed: () {},
              child: Text('Login'),
            ),
            CupertinoButton(
              onPressed: () {},
              child: Text('Forgot Password?'),
            ),
          ],
        ),
      ),
    );
  }
}
