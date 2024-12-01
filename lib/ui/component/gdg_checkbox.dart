import 'package:flutter/material.dart';
import 'package:gdg_dsgn/ui/theme/gdg_color_scheme.dart';
import 'dart:math' as math;

enum GdgCheckBoxVariant {
  disabled,
  enabled,
}

class GdgCheckbox extends StatefulWidget {
  const GdgCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.color = GdgColors.primary,
    this.tapTargetSize = 24.0,
  });

  final bool value;
  final void Function(bool? value)? onChanged;
  final GdgColor color;
  final double tapTargetSize;

  @override
  State<GdgCheckbox> createState() => _GdgCheckboxState();
}

class _GdgCheckboxState extends State<GdgCheckbox> {
  Color borderColor(GdgCheckBoxVariant variant) {
    if (variant == GdgCheckBoxVariant.disabled) {
      return widget.color == GdgColors.primary
          ? widget.color.shade400
          : widget.color.shade100;
    }
    if (widget.value) {
      return widget.color == GdgColors.primary
          ? widget.color.shade800
          : widget.color.shade500;
    }
    return widget.color == GdgColors.primary
        ? widget.color.shade700
        : widget.color.shade300;
  }

  Color fillColor(GdgCheckBoxVariant variant) {
    if (variant == GdgCheckBoxVariant.disabled) {
      return GdgColors.primary.shade200;
    }
    if (widget.value) {
      return widget.color == GdgColors.primary
          ? widget.color.shade800
          : widget.color.shade500;
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    final variant = widget.onChanged == null
        ? GdgCheckBoxVariant.disabled
        : GdgCheckBoxVariant.enabled;
    return GestureDetector(
      onTap: () {
        widget.onChanged!(!widget.value);
      },
      child: Container(
        color: Colors.transparent,
        width: math.max(widget.tapTargetSize, 14),
        height: math.max(widget.tapTargetSize, 14),
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
            child: const Center(
              child: Icon(
                Icons.check,
                size: 10,
                color: Colors.white,
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

// (new) Checkbox Checkbox({
//   Key? key,
//   required bool? value,
//   bool tristate = false,
//   required void Function(bool?)? onChanged,
//   MouseCursor? mouseCursor,
//   Color? activeColor,
//   WidgetStateProperty<Color?>? fillColor,
//   Color? checkColor,
//   Color? focusColor,
//   Color? hoverColor,
//   WidgetStateProperty<Color?>? overlayColor,
//   double? splashRadius,
//   MaterialTapTargetSize? materialTapTargetSize,
//   VisualDensity? visualDensity,
//   FocusNode? focusNode,
//   bool autofocus = false,
//   OutlinedBorder? shape,
//   BorderSide? side,
//   bool isError = false,
//   String? semanticLabel,
// })