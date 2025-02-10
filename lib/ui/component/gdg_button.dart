import 'package:flutter/material.dart';
import 'package:gdgku_design/ui/theme/gdg_color_scheme.dart';

// TODO size variant 추가, medium icon 추가
enum GdgButtonVariant {
  primary,
  primaryWithIcon,
  large,
  largeWithIcon,
  icon,
  disabledIcon,
  disabled,
  disabledWithIcon,
}

class GdgButton extends StatefulWidget {
  const GdgButton({
    super.key,
    required this.onPressed,
    this.child,
    this.icon,
    this.color = GdgColors.primary,
  }) : isLarge = false;

  const GdgButton.large({
    super.key,
    this.onPressed,
    this.child,
    this.icon,
    this.color = GdgColors.primary,
  }) : isLarge = true;

  final void Function()? onPressed;
  final Widget? child;
  final Widget? icon;
  final GdgColor color;
  final bool isLarge;

  @override
  State<GdgButton> createState() => _GdgButtonState();
}

class _GdgButtonState extends State<GdgButton> {
  bool isPressed = false;

  BoxConstraints constraint(GdgButtonVariant variant) {
    return switch (variant) {
      GdgButtonVariant.icon ||
      GdgButtonVariant.disabledIcon =>
        const BoxConstraints(
          minHeight: 42,
          maxHeight: 42,
          minWidth: 42,
          maxWidth: 42,
        ),
      _ => const BoxConstraints(
          minHeight: 42,
          maxHeight: 42,
          minWidth: 105,
        ),
    };
  }

  EdgeInsetsGeometry padding(GdgButtonVariant variant) {
    return switch (variant) {
      GdgButtonVariant.icon ||
      GdgButtonVariant.disabledIcon =>
        const EdgeInsets.all(10.4),
      _ => EdgeInsets.symmetric(
          vertical: widget.icon != null ? 11 : 12.1,
          horizontal: 17.3,
        ),
    };
  }

  ({Color backgroundColor, Color foregroundColor}) colors() {
    if (widget.onPressed == null) {
      if (isPressed) {
        return (
          backgroundColor: GdgColors.primary.shade400,
          foregroundColor: Colors.white,
        );
      }
      return (
        backgroundColor: GdgColors.primary.shade500,
        foregroundColor: Colors.white,
      );
    }

    if (isPressed) {
      return (
        backgroundColor: widget.color.shade300,
        foregroundColor: widget.color == GdgColors.primary
            ? GdgColors.primary.shade800
            : Colors.white,
      );
    }
    return switch (widget.color) {
      GdgColors.primary => (
          backgroundColor: GdgColors.primary.shade800,
          foregroundColor: Colors.white,
        ),
      GdgColors.blue => (
          backgroundColor: GdgColors.blue.shade500,
          foregroundColor: Colors.white,
        ),
      GdgColors.red => (
          backgroundColor: GdgColors.red.shade500,
          foregroundColor: Colors.white,
        ),
      GdgColors.green => (
          backgroundColor: GdgColors.green.shade500,
          foregroundColor: Colors.white,
        ),
      GdgColors.yellow => (
          backgroundColor: GdgColors.yellow.shade500,
          foregroundColor: Colors.white,
        ),
      _ => (
          backgroundColor: GdgColors.primary.shade800,
          foregroundColor: Colors.white,
        ),
    };
  }

  Widget _buildChild(
    Widget? child,
    Widget? icon,
    GdgButtonVariant variant,
  ) {
    final rowSize = widget.isLarge ? MainAxisSize.max : MainAxisSize.min;
    final children = switch (variant) {
      GdgButtonVariant.primary ||
      GdgButtonVariant.large ||
      GdgButtonVariant.disabled =>
        [child!],
      GdgButtonVariant.primaryWithIcon ||
      GdgButtonVariant.largeWithIcon ||
      GdgButtonVariant.disabledWithIcon =>
        [icon!, const SizedBox(width: 7.0), child!],
      GdgButtonVariant.icon || GdgButtonVariant.disabledIcon => [icon!],
    };
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: rowSize,
      children: children,
    );
  }

  void _checkAsserts() {
    assert(
      widget.child != null || widget.icon != null,
      "button must have child or icon",
    );
    assert(
      !(widget.isLarge && widget.child == null),
      "large button must have child",
    );
  }

  @override
  Widget build(BuildContext context) {
    _checkAsserts();

    GdgButtonVariant variant = () {
      if (widget.icon != null && widget.child == null) {
        return widget.onPressed == null
            ? GdgButtonVariant.disabledIcon
            : GdgButtonVariant.icon;
      }
      if (widget.onPressed == null) {
        return widget.icon != null
            ? GdgButtonVariant.disabledWithIcon
            : GdgButtonVariant.disabled;
      }
      if (widget.isLarge) {
        return widget.icon != null
            ? GdgButtonVariant.largeWithIcon
            : GdgButtonVariant.large;
      }

      return widget.icon != null
          ? GdgButtonVariant.primaryWithIcon
          : GdgButtonVariant.primary;
    }();
    final color = colors();
    var icon = widget.icon;
    if (icon != null) {
      icon = SizedBox(
        height: 20,
        width: 20,
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            color.foregroundColor,
            BlendMode.srcIn,
          ),
          child: icon,
        ),
      );
    }
    Widget child = _buildChild(widget.child, icon, variant);
    // TODO button theme으로 만들기
    final textStyle = TextStyle(
      color: color.foregroundColor,
      fontWeight: FontWeight.w600,
      fontSize: 14,
      height: 1,
    );

    return GestureDetector(
      onTap: widget.onPressed,
      onTapDown: (details) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: AnimatedContainer(
        constraints: constraint(variant),
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: color.backgroundColor,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Padding(
          padding: padding(variant),
          child: DefaultTextStyle(
            style: textStyle,
            child: child,
          ),
        ),
      ),
    );
  }
}
