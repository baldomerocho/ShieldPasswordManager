import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoaderPage extends StatelessWidget {
  final String message;
  const LoaderPage(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset('assets/lotties/animation_lmh4iopi.json'),
          Text(message, style: Theme.of(context).textTheme.headline6),
        ],
      )),
    );
  }
}
