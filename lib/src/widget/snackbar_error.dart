import 'package:flutter/material.dart';

Future snackBarError(BuildContext context, String messageError) async {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 3),
      content: Text(messageError),
      backgroundColor: Colors.red,
    ),
  );
}
