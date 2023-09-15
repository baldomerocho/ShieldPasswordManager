import 'package:flutter/material.dart';

class Noti{
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackError(
      {context, message}) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(message, style: TextStyle(color: Colors.pink.shade900),),
          duration: const Duration(seconds: 5),
          backgroundColor: Colors.pink.shade50
        ),
      );
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackSuccess(
      {context, message}) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message, style: TextStyle(color: Colors.teal.shade900),),
          duration: const Duration(seconds: 1),
          backgroundColor: Colors.teal.shade100
        ),
      );

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackWarning(
      {context, message}) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message, style: TextStyle(color: Colors.deepOrange.shade900),),
          duration: const Duration(seconds: 5),
          backgroundColor: Colors.orange.shade100
        ),
      );

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackInfo(
      {context, message}) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message, style: const TextStyle(color: Colors.white),),
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.blue.shade400
        ),
      );

  static noImplementado({context}) => snackWarning(context: context, message: "No se ha implementado");
}