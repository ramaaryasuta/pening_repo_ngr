import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  /// Colors
  Color get primaryColor {
    return Theme.of(this).colorScheme.primary;
  }

  Color get onPrimaryColor {
    return Theme.of(this).colorScheme.onPrimary;
  }

  Color get primaryContainerColor {
    return Theme.of(this).colorScheme.primaryContainer;
  }

  Color get onPrimaryContainerColor {
    return Theme.of(this).colorScheme.onPrimaryContainer;
  }

  Color get secondaryColor {
    return Theme.of(this).colorScheme.secondary;
  }

  Color get onSecondaryColor {
    return Theme.of(this).colorScheme.onSecondary;
  }

  Color get secondaryContainerColor {
    return Theme.of(this).colorScheme.secondaryContainer;
  }

  Color get onSecondaryContainerColor {
    return Theme.of(this).colorScheme.onSecondaryContainer;
  }

  Color get tertiaryColor {
    return Theme.of(this).colorScheme.tertiary;
  }

  Color get onTertiaryColor {
    return Theme.of(this).colorScheme.onTertiary;
  }

  Color get tertiaryContainerColor {
    return Theme.of(this).colorScheme.tertiaryContainer;
  }

  Color get onTertiaryContainerColor {
    return Theme.of(this).colorScheme.onTertiaryContainer;
  }

  Color get backgroundColor {
    return isDarkMode ? Theme.of(this).colorScheme.background : Colors.white;
    // return Theme.of(this).colorScheme.background;
  }

  Color get onBackgroundColor {
    return Theme.of(this).colorScheme.onBackground;
  }

  Color get surfaceColor {
    return Theme.of(this).colorScheme.surface;
  }

  Color get onSurfaceColor {
    return Theme.of(this).colorScheme.onSurface;
  }

  Color get surfaceVariantColor {
    return Theme.of(this).colorScheme.surfaceVariant;
  }

  Color get onSurfaceVariantColor {
    return Theme.of(this).colorScheme.onSurfaceVariant;
  }

  Color get outlineColor {
    return Theme.of(this).colorScheme.outline;
  }

  Color get outlineVariantColor {
    return Theme.of(this).colorScheme.surfaceVariant;
  }

  Color get errorColor {
    return Theme.of(this).colorScheme.error;
  }

  Color get onErrorColor {
    return Theme.of(this).colorScheme.onError;
  }

  Color get errorContainerColor {
    return Theme.of(this).colorScheme.errorContainer;
  }

  Color get onErrorContainerColor {
    return Theme.of(this).colorScheme.onErrorContainer;
  }

  Color get disabledColor {
    return Theme.of(this).colorScheme.onSurface.withOpacity(0.12);
  }

  Color get unSelectedColor {
    return Theme.of(this).colorScheme.onSurface.withOpacity(0.5);
  }

  Color get gradientColor1 {
    return isDarkMode ? tertiaryColor : primaryColor.withOpacity(0.8);
  }

  Color get gradientColor2 {
    return isDarkMode ? secondaryColor : errorColor.withOpacity(0.8);
  }

  Color get onGradientColor {
    return isDarkMode ? onTertiaryColor : onErrorColor;
  }

  bool get isDarkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }

  Color get shadowColor {
    return Theme.of(this).colorScheme.shadow;
  }

  Color get analyticsBackgroundColor {
    return isDarkMode ? backgroundColor : const Color(0xFFF3F4F4);
  }

  /// Text Styles
  TextStyle? get displayLargeTextStyle {
    return Theme.of(this).textTheme.displayLarge;
  }

  TextStyle? get displayMediumTextStyle {
    return Theme.of(this).textTheme.displayMedium;
  }

  TextStyle? get displaySmallTextStyle {
    return Theme.of(this).textTheme.displaySmall;
  }

  TextStyle? get headlineLargeTextStyle {
    return Theme.of(this).textTheme.headlineLarge;
  }

  TextStyle? get headlineMediumTextStyle {
    return Theme.of(this).textTheme.headlineMedium;
  }

  TextStyle? get headlineSmallTextStyle {
    return Theme.of(this).textTheme.headlineSmall;
  }

  TextStyle? get titleLargeTextStyle {
    return Theme.of(this).textTheme.titleLarge;
  }

  TextStyle? get titleMediumTextStyle {
    return Theme.of(this).textTheme.titleMedium;
  }

  TextStyle? get titleSmallTextStyle {
    return Theme.of(this).textTheme.titleSmall;
  }

  TextStyle? get labelLargeTextStyle {
    return Theme.of(this).textTheme.labelLarge;
  }

  TextStyle? get labelMediumTextStyle {
    return Theme.of(this).textTheme.labelMedium;
  }

  TextStyle? get labelSmallTextStyle {
    return Theme.of(this).textTheme.labelSmall;
  }

  TextStyle? get bodyLargeTextStyle {
    return Theme.of(this).textTheme.bodyLarge;
  }

  TextStyle? get bodyMediumTextStyle {
    return Theme.of(this).textTheme.bodyMedium;
  }

  TextStyle? get bodySmallTextStyle {
    return Theme.of(this).textTheme.bodySmall;
  }

  /// Text styles with colors
  TextStyle? getDisplayLargeTextStyle(Color textColor) {
    return displayLargeTextStyle?.copyWith(color: textColor);
  }

  TextStyle? getDisplayMediumTextStyle(Color textColor) {
    return displayMediumTextStyle?.copyWith(color: textColor);
  }

  TextStyle? getDisplaySmallTextStyle(Color textColor) {
    return displaySmallTextStyle?.copyWith(color: textColor);
  }

  TextStyle? getHeadlineLargeTextStyle(Color textColor) {
    return headlineLargeTextStyle?.copyWith(color: textColor);
  }

  TextStyle? getHeadlineMediumTextStyle(Color textColor) {
    return headlineMediumTextStyle?.copyWith(color: textColor);
  }

  TextStyle? getHeadlineSmallTextStyle(Color textColor) {
    return headlineSmallTextStyle?.copyWith(color: textColor);
  }

  TextStyle? getTitleLargeTextStyle(Color textColor) {
    return titleLargeTextStyle?.copyWith(color: textColor);
  }

  TextStyle? getTitleMediumTextStyle(Color textColor) {
    return titleMediumTextStyle?.copyWith(color: textColor);
  }

  TextStyle? getTitleSmallTextStyle(Color textColor) {
    return titleSmallTextStyle?.copyWith(color: textColor);
  }

  TextStyle? getLabelLargeTextStyle(Color textColor) {
    return labelLargeTextStyle?.copyWith(color: textColor);
  }

  TextStyle? getLabelMediumTextStyle(Color textColor) {
    return labelMediumTextStyle?.copyWith(color: textColor);
  }

  TextStyle? getLabelSmallTextStyle(Color textColor) {
    return labelSmallTextStyle?.copyWith(color: textColor);
  }

  TextStyle? getBodyLargeTextStyle(Color textColor) {
    return bodyLargeTextStyle?.copyWith(color: textColor);
  }

  TextStyle? getBodyMediumTextStyle(Color textColor) {
    return bodyMediumTextStyle?.copyWith(color: textColor);
  }

  TextStyle? getBodySmallTextStyle(Color textColor) {
    return bodySmallTextStyle?.copyWith(color: textColor);
  }
}
