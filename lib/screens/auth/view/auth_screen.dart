import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../generated/assets.gen.dart';
import '../../../shared/widgets/buttons/filled_button.dart';
import '../../../shared/widgets/images/assets_image.dart';
import '../../../shared/widgets/snackbar.dart';
import '../providers/auth_provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late AuthenticationProvider _authP;

  @override
  void initState() {
    _authP = context.read<AuthenticationProvider>();
    super.initState();
  }

  void loginGmail() async {
    try {
      final response = await _authP.login();
      if (mounted && response != null) {
        if (mounted) {
          showSnackbar(
            context: context,
            message: 'Login success',
            status: SnackbarStatus.success,
          );
        }

        context.go('/home');
      } else {
        if (mounted) {
          showSnackbar(
            context: context,
            message: 'Login failed',
            status: SnackbarStatus.error,
          );
        }
      }
    } catch (e) {
      if (mounted) {
        showSnackbar(
          context: context,
          message: e.toString(),
          status: SnackbarStatus.error,
        );
      }
    }
  }

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
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'PNR',
                        style: context.displayMediumTextStyle!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Pening Repository by NGR',
                        style: context.labelSmallTextStyle,
                      ),
                      const SizedBox(height: 30),
                      MFilledButton(
                        onPressed: () {
                          loginGmail();
                        },
                        icon: MAssetImage(Assets.icons.google, height: 22),
                        child: const Text('Continue with Google'),
                      ),
                    ],
                  ),
                ),
              ),
              if (maxWidth > 1100) ...[
                Expanded(child: Container(color: Colors.black)),
              ],
            ],
          );
        },
      ),
    );
  }
}
