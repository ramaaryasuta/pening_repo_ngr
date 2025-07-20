import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/extensions/context_extensions.dart';
import 'package:provider/provider.dart';

import '../../screens/auth/providers/auth_provider.dart';

class MDrawer extends StatelessWidget {
  const MDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.pop(context);
                context.go('/home');
              },
              leading: const Icon(Icons.home_outlined),
              title: Text('Home', style: context.bodyMediumTextStyle),
            ),
            const Spacer(),
            ListTile(
              onTap: () {
                final authP = context.read<AuthenticationProvider>();
                authP.logout();
                context.go('/auth');
              },
              leading: const Icon(Icons.logout, color: Colors.red),
              title: Text(
                'Logout',
                style: context.bodyMediumTextStyle!.copyWith(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
