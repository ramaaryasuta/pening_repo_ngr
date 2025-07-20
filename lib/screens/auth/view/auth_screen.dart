import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;

          return Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Column(children: [Text('Login PNR by NGR')]),
                ),
              ),
              if (maxWidth > 1100) ...[
                Expanded(child: Container(color: Colors.green)),
              ],
            ],
          );
        },
      ),
    );
  }
}
