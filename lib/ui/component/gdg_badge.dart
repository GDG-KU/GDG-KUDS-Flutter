import 'package:flutter/material.dart';
import 'package:gdg_dsgn/ui/theme/gdg_color_scheme.dart';

enum GdgBadgeVariant {
  lightPrimary,
  deepPrimary,
  lightColored,
  deepColored,
}

class GdgBadge extends StatelessWidget {
  final GdgColor color;
  final Widget child;
  final bool isDeep;

  const GdgBadge.light({
    super.key,
    this.color = GdgColors.primary,
    required this.child,
  }) : isDeep = false;

  const GdgBadge.deep({
    super.key,
    this.color = GdgColors.primary,
    required this.child,
  }) : isDeep = true;

  ({Color backgroundColor, Color foregroundColor}) colors(
    GdgBadgeVariant variant,
  ) {
    return switch (variant) {
      GdgBadgeVariant.lightPrimary => (
          backgroundColor: GdgColors.primary.shade300,
          foregroundColor: GdgColors.primary.shade800,
        ),
      GdgBadgeVariant.deepPrimary => (
          backgroundColor: GdgColors.primary.shade800,
          foregroundColor: GdgColors.primary.shade100,
        ),
      GdgBadgeVariant.lightColored => (
          backgroundColor: color.shade100,
          foregroundColor: color.shade500,
        ),
      GdgBadgeVariant.deepColored => (
          backgroundColor: color.shade500,
          foregroundColor: GdgColors.primary.shade100,
        ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final variant = () {
      if (color == GdgColors.primary) {
        return isDeep
            ? GdgBadgeVariant.deepPrimary
            : GdgBadgeVariant.lightPrimary;
      } else {
        return isDeep
            ? GdgBadgeVariant.deepColored
            : GdgBadgeVariant.lightColored;
      }
    }();

    //TODO badge theme 추가
    final textStyle = TextStyle(
      color: colors(variant).foregroundColor,
      fontWeight: FontWeight.w500,
      fontSize: 11,
    );
    return Container(
      constraints: const BoxConstraints(
        minWidth: 50,
        minHeight: 19.2,
        maxHeight: 19.2,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: colors(variant).backgroundColor,
      ),
      child: DefaultTextStyle(
        style: textStyle,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
