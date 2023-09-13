import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final String message;
  const LoginPage(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(message),
      ));
  }
}
