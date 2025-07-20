import 'package:flutter/material.dart';
import 'buttons/filled_button.dart';
import 'buttons/outline_button.dart';

void baseDialog(
  BuildContext context, {
  required Widget child,
  bool oneButton = false,
  String textBtn = 'Submit',
  required VoidCallback onPressed,
  double maxWidth = 600,
  double maxHeight = 800,
}) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            child,
            const SizedBox(height: 20),
            Row(
              spacing: 10,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (!oneButton)
                  MOutlineButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"),
                  ),
                MFilledButton(onPressed: onPressed, child: Text(textBtn)),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
