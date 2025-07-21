import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class UiHelper {
  static double getDeviceHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static void showLoadingDialog(
    BuildContext context, {
    required bool isLoading,
  }) {
    if (isLoading) {
      showDialog(
        context: context,
        builder: (context) => const Center(child: CupertinoActivityIndicator()),
      );
    } else {
      Navigator.pop(context);
    }
  }
}
