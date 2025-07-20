import 'package:flutter/material.dart';
import '../../../core/extensions/context_extensions.dart';

class MOutlineButton extends StatelessWidget {
  const MOutlineButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.padding,
    this.borderColor,
    this.height,
    this.icon,
    this.tooltipMessage = "",
  });

  final Widget child;
  final VoidCallback? onPressed;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final Widget? icon;
  final String tooltipMessage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Tooltip(
        message: tooltipMessage,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: borderColor ?? context.primaryColor,
            padding:
                padding ??
                const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
            side: BorderSide(color: borderColor ?? context.primaryColor),
          ),
          child: icon == null
              ? child
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [icon!, const SizedBox(width: 8), child],
                ),
        ),
      ),
    );
  }
}
