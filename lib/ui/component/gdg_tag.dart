import 'package:flutter/material.dart';
import 'package:gdg_dsgn/ui/theme/gdg_color_scheme.dart';

enum GdgTagSize {
  small,
  medium,
}

enum GdgTagVariant {
  outline,
  filled,
  icon,
}

class GdgTag extends StatelessWidget {
  const GdgTag.small({
    super.key,
    required this.value,
    this.icon,
    bool isFilled = false,
    this.color = GdgColors.primary,
    required this.onChanged,
    required this.child,
  })  : size = GdgTagSize.small,
        variant = icon != null
            ? GdgTagVariant.icon
            : isFilled
                ? GdgTagVariant.filled
                : GdgTagVariant.outline;

  const GdgTag.medium({
    super.key,
    required this.value,
    this.icon,
    bool isFilled = false,
    this.color = GdgColors.primary,
    required this.onChanged,
    required this.child,
  })  : size = GdgTagSize.medium,
        variant = icon != null
            ? GdgTagVariant.icon
            : isFilled
                ? GdgTagVariant.filled
                : GdgTagVariant.outline;

  final GdgTagSize size;
  final GdgTagVariant variant;
  final Widget child;
  final IconData? icon;
  final bool value;
  final GdgColor color;
  final void Function(bool)? onChanged;

  Color foregroundColor() {
    if (value) {
      return color == GdgColors.primary
          ? GdgColors.primary.shade800
          : color.shade500;
    }
    return color == GdgColors.primary
        ? GdgColors.primary.shade500
        : color.shade300;
  }

  Color fillColor() {
    if (variant == GdgTagVariant.filled) {
      return color == GdgColors.primary
          ? GdgColors.primary.shade300
          : color.shade100;
    }
    return GdgColors.primary.shade100;
  }

  BoxConstraints constraint() {
    if (size == GdgTagSize.medium) {
      return const BoxConstraints(
        minHeight: 21,
        maxHeight: 21,
        minWidth: 56.5,
      );
    }
    return const BoxConstraints(
      minHeight: 19.1,
      maxHeight: 19.1,
      minWidth: 48,
    );
  }

  EdgeInsetsGeometry padding() {
    if (size == GdgTagSize.small) {
      return const EdgeInsets.symmetric(horizontal: 8.7);
    }
    return const EdgeInsets.symmetric(horizontal: 10.4);
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: foregroundColor(),
      fontWeight: FontWeight.w500,
      fontSize: size == GdgTagSize.small ? 11 : 12.1,
    );
    return GestureDetector(
      onTap: () {
        onChanged!(!value);
      },
      child: FittedBox(
        child: Container(
          constraints: constraint(),
          padding: padding(),
          decoration: BoxDecoration(
            color: value ? fillColor() : Colors.transparent,
            border: Border.all(
              color: foregroundColor(),
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: DefaultTextStyle(
            style: textStyle,
            child: Center(
              child: Row(
                children: [
                  child,
                  if (variant == GdgTagVariant.icon && value) ...[
                    const SizedBox(width: 5.95),
                    Icon(
                      icon,
                      size: 12,
                      weight: 700,
                      grade: 200,
                      color: foregroundColor(),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
