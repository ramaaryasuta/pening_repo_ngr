import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/extensions/context_extensions.dart';

class MTextField extends StatelessWidget {
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final bool isDense;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextCapitalization textCapitalization;
  final String? title;
  final String? subtitle;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? errorText;
  final String? prefixText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? helperMaxLines;
  final int? maxLines;
  final int minLines;
  final int? maxLength;
  final dynamic Function()? onTap;
  final TextStyle? hintStyle;
  final bool isFilled;
  final Color? fillColor;
  final TextStyle? prefixStyle;
  final EdgeInsetsGeometry? padding;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry margin;
  final bool showLabel;
  final TextStyle? labelStyle;
  final String? Function(String?)? validator;
  final String? initialValue;
  final AutovalidateMode? autovalidateMode;
  final TextAlign textAlign;
  final BoxConstraints? suffixIconConstraints;
  final TextStyle? style;
  final Color? cursorColor;
  final TextStyle? titleStyle;
  final Widget? widgetNextAfterTitle;
  final Color? overrideAllBorderColor;

  const MTextField({
    super.key,
    this.obscureText = false,
    this.enableSuggestions = false,
    this.autocorrect = false,
    this.isDense = false,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.controller,
    this.textInputAction,
    this.keyboardType,
    this.title,
    this.subtitle,
    this.hintText,
    this.labelText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixText,
    this.onEditingComplete,
    this.onSubmitted,
    this.onChanged,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines = 1,
    this.minLines = 1,
    this.helperMaxLines = 4,
    this.maxLength,
    this.onTap,
    this.hintStyle,
    this.isFilled = false,
    this.fillColor,
    this.padding,
    this.prefixStyle,
    this.focusNode,
    this.decoration,
    this.floatingLabelBehavior,
    this.inputFormatters,
    this.margin = EdgeInsets.zero,
    this.showLabel = false,
    this.labelStyle,
    this.validator,
    this.initialValue,
    this.autovalidateMode,
    this.textAlign = TextAlign.start,
    this.suffixIconConstraints,
    this.style,
    this.cursorColor,
    this.titleStyle,
    this.widgetNextAfterTitle,
    this.overrideAllBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(title!, style: titleStyle ?? context.titleSmallTextStyle),
                if (widgetNextAfterTitle != null) ...[
                  const SizedBox(width: 5),
                  widgetNextAfterTitle!,
                ],
              ],
            ),
          if (subtitle != null) ...[
            const SizedBox(height: 2),
            Text(
              subtitle!,
              style: context.labelMediumTextStyle!.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
          if (title != null) const SizedBox(height: 8),
          TextFormField(
            textAlign: textAlign,
            initialValue: controller == null ? initialValue : null,
            onTap: onTap,
            autovalidateMode: autovalidateMode,
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            obscureText: obscureText,
            enableSuggestions: enableSuggestions,
            autocorrect: autocorrect,
            enabled: enabled,
            readOnly: readOnly,
            autofocus: autofocus,
            controller: controller,
            textInputAction: textInputAction,
            keyboardType: keyboardType,
            validator: validator,
            cursorColor: cursorColor ?? context.primaryColor,
            cursorWidth: 1,
            onEditingComplete: onEditingComplete,
            onFieldSubmitted: onSubmitted,
            onChanged: onChanged,
            textCapitalization: textCapitalization,
            minLines: minLines,
            maxLines: maxLines,
            focusNode: focusNode,
            maxLength: maxLength,
            style:
                style ?? context.getBodyMediumTextStyle(context.onSurfaceColor),
            decoration: decoration ?? buildInputDecoration(context),
            inputFormatters: inputFormatters,
          ),
        ],
      ),
    );
  }

  InputDecoration buildInputDecoration(BuildContext context) {
    return InputDecoration(
      isDense: isDense,
      counterText: '',
      hintText: hintText,
      labelText: showLabel ? labelText : null,
      helperText: helperText,
      errorText: errorText,
      prefixText: prefixText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: padding,
      helperMaxLines: helperMaxLines,
      suffixIconColor: context.onSurfaceVariantColor,
      prefixIconColor: context.onSurfaceVariantColor,
      fillColor: fillColor,
      filled: isFilled || fillColor != null,
      floatingLabelBehavior: floatingLabelBehavior,
      suffixIconConstraints: suffixIconConstraints,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color:
              overrideAllBorderColor ??
              context.outlineColor.withValues(alpha: .7),
          width: 0.5,
          style: BorderStyle.solid,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color:
              overrideAllBorderColor ??
              context.outlineColor.withValues(alpha: .7),
          width: 0.5,
          style: BorderStyle.solid,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: overrideAllBorderColor ?? context.primaryColor,
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: overrideAllBorderColor ?? context.errorColor,
          width: 2,
          style: BorderStyle.solid,
        ),
      ),
      errorStyle: context.getBodySmallTextStyle(context.errorColor),
      helperStyle: context.getBodySmallTextStyle(context.onSurfaceVariantColor),
      labelStyle: labelStyle ?? context.getBodyMediumTextStyle(Colors.grey),
      hintStyle: hintStyle ?? context.getBodyMediumTextStyle(Colors.grey),
      prefixStyle: prefixStyle ?? context.getBodyMediumTextStyle(Colors.grey),
    );
  }
}

class MTextFieldV2 extends StatelessWidget {
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final bool isDense;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextCapitalization textCapitalization;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? errorText;
  final String? prefixText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? helperMaxLines;
  final int? maxLines;
  final int? maxLength;
  final dynamic Function()? onTap;
  final TextStyle? hintStyle;
  final TextStyle? prefixStyle;

  const MTextFieldV2({
    super.key,
    this.obscureText = false,
    this.enableSuggestions = false,
    this.autocorrect = false,
    this.isDense = false,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.controller,
    this.textInputAction,
    this.keyboardType,
    this.hintText,
    this.labelText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixText,
    this.onEditingComplete,
    this.onSubmitted,
    this.onChanged,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines = 1,
    this.helperMaxLines = 4,
    this.maxLength,
    this.onTap,
    this.hintStyle,
    this.prefixStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      obscureText: obscureText,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      enabled: enabled,
      readOnly: readOnly,
      autofocus: autofocus,
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      cursorColor: context.primaryColor,
      cursorWidth: 1,
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmitted,
      onChanged: onChanged,
      textCapitalization: textCapitalization,
      maxLines: maxLines,
      maxLength: maxLength,
      style: context.getBodyLargeTextStyle(context.onSurfaceColor),
      decoration: InputDecoration(
        isDense: isDense,
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        errorText: errorText,
        prefixText: prefixText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        helperMaxLines: helperMaxLines,
        suffixIconColor: context.onSurfaceVariantColor,
        prefixIconColor: context.onSurfaceVariantColor,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        errorStyle: context.getBodySmallTextStyle(context.errorColor),
        helperStyle: context.getBodySmallTextStyle(
          context.onSurfaceVariantColor,
        ),
        hintStyle:
            hintStyle ??
            context.getBodyLargeTextStyle(context.onSurfaceVariantColor),
        prefixStyle:
            prefixStyle ??
            context.getBodyLargeTextStyle(
              context.onSurfaceColor.withValues(alpha: .5),
            ),
      ),
    );
  }
}
