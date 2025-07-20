import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../shared/utils/preferences.dart';

class AuthGuard extends StatelessWidget {
  final Widget child;

  const AuthGuard({super.key, required this.child});

  Future<bool> isLoggedIn() async {
    return await getIsLogged();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: isLoggedIn(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CupertinoActivityIndicator()),
          );
        }

        final isLogged = snapshot.data!;
        if (!isLogged) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            context.go('/auth');
          });
          return const SizedBox.shrink();
        }

        return child;
      },
    );
  }
}
