import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MNetworkImage extends StatelessWidget {
  const MNetworkImage(
    this.url, {
    super.key,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.placeholderWidget,
    this.errorWidget,
    this.color,
    this.defaultErrorIconSize = 24,
    this.alignment,
    this.emptyErrorWidget = false,
    this.emptyPlaceholderWidget = false,
    this.emptyProgressWidget = false,
    this.radius = 0,
    this.borderRadius,
  });

  final String? url;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Widget? placeholderWidget;
  final Widget? errorWidget;
  final Color? color;
  final double? defaultErrorIconSize;
  final Alignment? alignment;
  final bool emptyErrorWidget;
  final bool emptyPlaceholderWidget;
  final bool emptyProgressWidget;
  final double radius;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    if (url?.endsWith('svg') ?? false) {
      return SizedBox(
        width: width,
        height: height,
        child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.circular(radius),
          child: SvgPicture.network(
            '$url',
            height: height,
            width: width,
            colorFilter: color == null
                ? null
                : ColorFilter.mode(color!, BlendMode.srcIn),
            fit: fit,
          ),
        ),
      );
    }

    if (url?.isEmpty ?? false) {
      if (errorWidget != null) return errorWidget!;
      return Icon(
        Icons.image_not_supported_outlined,
        size: defaultErrorIconSize,
        color: color,
      );
    }

    // webOnlyInstantiateImageCodecFromUrl deprecated warning coming from CachedNetworkImage package at cached_network_image_web
    // it can ignore for now, when the webOnlyInstantiateImageCodecFromUrl API is complete remove and cached_network_image_web
    // not updating it, we will easily modify this by ourself.
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(radius),
      child: SizedBox(
        width: width,
        height: height,
        child: CachedNetworkImage(
          imageUrl: '$url',
          fit: fit,
          color: color,
          alignment: alignment ?? Alignment.center,
          placeholder: (_, __) =>
              const Center(child: CupertinoActivityIndicator()),
          errorWidget: (_, __, ___) {
            log('failed to load image $url');
            return errorWidget ??
                Icon(Icons.broken_image, color: color ?? Colors.grey);
          },
        ),
      ),
    );
  }
}
