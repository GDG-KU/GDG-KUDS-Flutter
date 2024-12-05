import 'package:flutter/material.dart';
import 'package:gdg_dsgn/ui/theme/gdg_color_scheme.dart';
import 'package:gdg_dsgn/ui/theme/gdg_theme.dart';

enum GdgInputSize {
  small,
  medium,
}

enum GdgInputState {
  normal,
  error,
  success,
}

// TODO form 형태도 구현 필요.
class GdgInput extends StatefulWidget {
  const GdgInput.medium({
    super.key,
    this.controller,
    this.label,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.maxLength,
    this.onChanged,
    this.cursorColor = GdgColors.primary,
    this.prefix,
    this.suffix,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.cursorWidth = 1.0,
    this.helpText,
    this.state = GdgInputState.normal,
  }) : size = GdgInputSize.medium;
  const GdgInput.small({
    super.key,
    this.controller,
    this.label,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.maxLength,
    this.onChanged,
    this.cursorColor = GdgColors.primary,
    this.prefix,
    this.suffix,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.cursorWidth = 1.0,
    this.helpText,
    this.state = GdgInputState.normal,
  }) : size = GdgInputSize.small;

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final String obscuringCharacter;
  final bool obscureText;
  final double cursorWidth;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final Color? cursorColor;
  final IconData? prefix;
  final IconData? suffix;
  final GdgInputSize size;
  final String? label;
  final String? helpText;
  final GdgInputState state;

  @override
  State<GdgInput> createState() => _GdgInputState();
}

class _GdgInputState extends State<GdgInput> {
  final hasFocus = ValueNotifier(false);
  FocusNode? _focusNode;
  FocusNode get effectiveFocusNode => widget.focusNode ?? _focusNode!;
  TextEditingController? _controller;
  TextEditingController get effectiveController =>
      widget.controller ?? _controller!;

  void onFocusChange() {
    hasFocus.value = effectiveFocusNode.hasFocus;
  }

  @override
  void initState() {
    super.initState();
    if (widget.focusNode == null) {
      _focusNode = FocusNode();
    }
    effectiveFocusNode.addListener(onFocusChange);
    if (widget.controller == null) {
      _createLocalController(const TextEditingValue(text: ''));
    }
  }

  @override
  void didUpdateWidget(GdgInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.focusNode != oldWidget.focusNode) {
      oldWidget.focusNode?.removeListener(onFocusChange);
      effectiveFocusNode.addListener(onFocusChange);
    }
    if (widget.controller == null && oldWidget.controller != null) {
      _createLocalController(oldWidget.controller!.value);
    } else if (widget.controller != null && oldWidget.controller == null) {
      _controller!.dispose();
      _controller = null;
    }
  }

  @override
  void dispose() {
    effectiveFocusNode.removeListener(onFocusChange);

    if (widget.focusNode == null) effectiveFocusNode.dispose();
    _controller?.dispose();
    super.dispose();
  }

  void _createLocalController([TextEditingValue? value]) {
    assert(_controller == null);
    _controller = value == null
        ? TextEditingController()
        : TextEditingController.fromValue(value);
  }

  EdgeInsets padding() {
    return switch (widget.size) {
      GdgInputSize.small => const EdgeInsets.symmetric(horizontal: 17),
      GdgInputSize.medium => const EdgeInsets.symmetric(horizontal: 17),
    };
  }

  TextStyle textStyle() {
    return TextStyle(
        fontSize: switch (widget.size) {
          GdgInputSize.small => 13.0,
          GdgInputSize.medium => 14.0,
        },
        color: hasFocus.value
            ? GdgColors.primary[800]
            : GdgColors.primary.withOpacity(0.4),
        fontFamily: "Pretendard");
  }

  BoxConstraints constraint() {
    return switch (widget.size) {
      GdgInputSize.small => const BoxConstraints.tightFor(
          height: 30,
        ),
      GdgInputSize.medium => const BoxConstraints.tightFor(
          height: 42,
        ),
    };
  }

  TextStyle helpTextStyle() {
    return TextStyle(
      fontSize: switch (widget.size) {
        _ => 11.0,
      },
      color: switch (widget.state) {
        GdgInputState.normal => GdgColors.primary.withOpacity(0.7),
        GdgInputState.error => GdgColors.red,
        GdgInputState.success => GdgColors.green,
      },
      height: 2,
      fontFamily: "Pretendard",
    );
  }

  BoxBorder border(bool focused) {
    Color color = switch (widget.state) {
      GdgInputState.normal =>
        focused ? GdgColors.primary[800]! : GdgColors.primary[500]!,
      GdgInputState.error => GdgColors.red,
      GdgInputState.success => GdgColors.green,
    };
    return Border.all(
      color: color,
      width: 1.1,
    );
  }

  Widget iconBuilder(IconData iconData) {
    return SizedBox(
      height: widget.size == GdgInputSize.medium ? 20 : 18,
      width: widget.size == GdgInputSize.medium ? 20 : 18,
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          switch (widget.state) {
            GdgInputState.normal => GdgColors.primary[800]!,
            GdgInputState.error => GdgColors.red,
            GdgInputState.success => GdgColors.green,
          },
          BlendMode.srcIn,
        ),
        child: Icon(iconData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: hasFocus,
      builder: (context, focused, _) {
        return ValueListenableBuilder(
          valueListenable: effectiveController,
          builder: (context, textEditingValue, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.label != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: Text(
                      widget.label!,
                      style: switch (widget.size) {
                        GdgInputSize.small =>
                          GdgTheme.of(context).textTheme.label2,
                        GdgInputSize.medium =>
                          GdgTheme.of(context).textTheme.body1Small,
                      },
                    ),
                  ),
                Container(
                  decoration: BoxDecoration(
                    color: GdgColors.primary[100],
                    border: border(focused),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  padding: padding(),
                  constraints: constraint(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.prefix != null) iconBuilder(widget.prefix!),
                      if (widget.prefix != null) const SizedBox(width: 6.0),
                      Expanded(
                        child: TextField(
                          controller: effectiveController,
                          focusNode: effectiveFocusNode,
                          keyboardType: widget.keyboardType,
                          textInputAction: widget.textInputAction,
                          style: textStyle(),
                          maxLength: widget.maxLength,
                          onChanged: widget.onChanged,
                          cursorColor: widget.cursorColor,
                          cursorHeight: 13,
                          scrollPadding: EdgeInsets.zero,
                          obscureText: widget.obscureText,
                          obscuringCharacter: widget.obscuringCharacter,
                          cursorWidth: widget.cursorWidth,
                          decoration: const InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      if (widget.suffix != null) const SizedBox(width: 6.0),
                      if (widget.suffix != null) iconBuilder(widget.suffix!),
                    ],
                  ),
                ),
                if (widget.helpText != null && widget.helpText!.isNotEmpty)
                  Text(widget.helpText!, style: helpTextStyle()),
              ],
            );
          },
        );
      },
    );
  }
}
