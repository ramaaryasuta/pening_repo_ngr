import 'package:flutter/material.dart';
import '../../../core/extensions/context_extensions.dart';

class MFilledButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? borderRadius;
  final Widget? icon;
  final String tooltipMessage;

  const MFilledButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.padding,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
    this.icon,
    this.tooltipMessage = "",
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltipMessage,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: foregroundColor ?? context.onPrimaryColor,
          backgroundColor: backgroundColor ?? context.primaryColor,
          padding:
              padding ??
              const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
          shape: borderRadius == null
              ? null
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius!),
                ),
        ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
        onPressed: onPressed,
        child: icon == null
            ? child
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [icon!, const SizedBox(width: 8), child],
              ),
      ),
    );
  }
}
