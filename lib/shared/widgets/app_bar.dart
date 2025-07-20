import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:pening_repository_ngr/core/extensions/context_extensions.dart';
import 'package:pening_repository_ngr/shared/widgets/images/network_image.dart';
import 'package:provider/provider.dart';

import '../../screens/auth/providers/auth_provider.dart';

class MAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MAppBar({super.key});

  @override
  State<MAppBar> createState() => _MAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MAppBarState extends State<MAppBar> {
  final toottipCtrl = JustTheController();

  @override
  Widget build(BuildContext context) {
    final authP = context.read<AuthenticationProvider>();

    return LayoutBuilder(
      builder: (context, constraint) {
        final maxWidth = constraint.maxWidth;

        return AppBar(
          centerTitle: false,
          title: Text(
            "PRN",
            style: context.titleMediumTextStyle!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 2,
          shadowColor: Colors.black,
          actions: [
            JustTheTooltip(
              controller: toottipCtrl,
              isModal: true,
              tailLength: 10,
              tailBaseWidth: 16,
              content: Container(
                width: 250,
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      onTap: () {
                        context.read<AuthenticationProvider>().logout();
                        context.go('/');
                      },
                      leading: const Icon(Icons.logout, size: 16),
                      title: Text(
                        "Logout",
                        style: context.labelSmallTextStyle!.copyWith(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  spacing: 10,
                  children: [
                    if (maxWidth > 600) ...[
                      const SizedBox(width: 10),
                      Text(
                        authP.user?.displayName ?? "",
                        style: context.bodySmallTextStyle,
                      ),
                    ],
                    CircleAvatar(
                      child: MNetworkImage(
                        authP.user?.photoURL,
                        radius: 100,
                        fit: BoxFit.cover,
                        width: 32,
                        height: 32,
                        errorWidget: const Icon(
                          Icons.account_circle,
                          color: Colors.grey,
                          size: 32,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
