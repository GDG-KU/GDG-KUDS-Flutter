import 'package:flutter/material.dart';
import 'package:gdg_dsgn/ui/theme/gdg_color_scheme.dart';
import 'dart:math' as math;

enum GdgCheckBoxVariant {
  disabled,
  enabled,
}

class GdgCheckbox extends StatelessWidget {
  const GdgCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.color = GdgColors.primary,
    this.tapTargetSize = 24.0,
  });

  final bool value;
  final void Function(bool value)? onChanged;
  final GdgColor color;
  final double tapTargetSize;

  Color borderColor(GdgCheckBoxVariant variant) {
    if (variant == GdgCheckBoxVariant.disabled) {
      return color == GdgColors.primary ? color.shade400 : color.shade100;
    }
    if (value) {
      return color == GdgColors.primary ? color.shade800 : color.shade500;
    }
    return color == GdgColors.primary ? color.shade700 : color.shade300;
  }

  Color fillColor(GdgCheckBoxVariant variant) {
    if (variant == GdgCheckBoxVariant.disabled) {
      return GdgColors.primary.shade200;
    }
    if (value) {
      return color == GdgColors.primary ? color.shade800 : color.shade500;
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    final variant = onChanged == null
        ? GdgCheckBoxVariant.disabled
        : GdgCheckBoxVariant.enabled;
    return GestureDetector(
      onTap: () {
        onChanged!(!value);
      },
      child: Container(
        color: Colors.transparent,
        width: math.max(tapTargetSize, 14),
        height: math.max(tapTargetSize, 14),
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeOut,
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: fillColor(variant),
              borderRadius: BorderRadius.circular(3.5),
              border: Border.all(
                color: borderColor(variant),
                width: 1.73,
              ),
            ),
            child: Center(
              child: Icon(
                Icons.check,
                size: 10,
                color: value ? Colors.white : Colors.transparent,
                weight: 700,
                grade: 200,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
