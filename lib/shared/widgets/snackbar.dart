import 'package:flutter/material.dart';
import 'package:pening_repository_ngr/core/extensions/context_extensions.dart';

enum SnackbarStatus { success, error, warning }

void showSnackbar({
  required BuildContext context,
  required String message,
  SnackbarStatus status = SnackbarStatus.success,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: context.bodySmallTextStyle!.copyWith(color: Colors.white),
      ),
      backgroundColor: status == SnackbarStatus.success
          ? Colors.green
          : status == SnackbarStatus.error
          ? Colors.red
          : Colors.yellow,
    ),
  );
}
