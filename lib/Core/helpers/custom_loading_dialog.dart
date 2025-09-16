import 'package:flutter/material.dart';

Future<void> customLoadingDialog(BuildContext context) async {
  await showAdaptiveDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ),
  );
}
