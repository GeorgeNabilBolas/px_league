import 'package:flutter/material.dart';

void customArSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        textDirection: TextDirection.rtl,
        message,
      ),
    ),
  );
}
