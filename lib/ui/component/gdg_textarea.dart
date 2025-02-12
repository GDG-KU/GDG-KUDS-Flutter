import 'package:flutter/material.dart';
import 'package:gdgku_design/ui/theme/gdg_color_scheme.dart';
import 'package:gdgku_design/ui/theme/gdg_theme.dart';

extension _WidgetX on Widget {
  Widget withScrollbar(bool show) {
    if (!show) return this;
    return Scrollbar(
      radius: const Radius.circular(100),
      thickness: 2.6,
      child: this,
    );
  }
}

class GdgTextarea extends StatefulWidget {
  const GdgTextarea({
    super.key,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.cursorWidth = 1.0,
    this.maxLength,
    this.onChanged,
    this.cursorColor = GdgColors.primary,
    this.label,
    this.decoration,
    this.maxLines = 4,
    this.enabled = true,
    this.scrollBarVisiblity = true,
  });

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final double cursorWidth;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final Color cursorColor;
  final String? label;
  final InputDecoration? decoration;
  final bool enabled;
  final bool scrollBarVisiblity;
  final int maxLines;

  @override
  State<GdgTextarea> createState() => _GdgTextareaState();
}

class _GdgTextareaState extends State<GdgTextarea> {
  final hasFocus = ValueNotifier(false);
  FocusNode? _focusNode;
  FocusNode get effectiveFocusNode => widget.focusNode ?? _focusNode!;
  TextEditingController? _controller;
  TextEditingController get effectiveController =>
      widget.controller ?? _controller!;
  InputDecoration get effectiveDecoration =>
      widget.decoration ?? const InputDecoration();

  void onFocusChange() => hasFocus.value = effectiveFocusNode.hasFocus;

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
  void didUpdateWidget(GdgTextarea oldWidget) {
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

  BoxBorder boxBorder(bool focused) {
    var color = GdgColors.primary[800];
    if (!widget.enabled) {
      color = GdgColors.primary[300];
    } else if (!focused) {
      color = GdgColors.primary[500];
    }
    return Border.all(
      color: color!,
      width: 1.1,
    );
  }

  Color? boxColor() {
    return widget.enabled ? GdgColors.primary[100] : GdgColors.primary[200]!;
  }

  TextStyle textStyle(BuildContext context, bool focused) {
    return GdgTheme.of(context).textTheme.body2Medium.copyWith(
          color: focused
              ? Colors.black.withOpacity(0.75)
              : Colors.black.withOpacity(0.4),
          textBaseline: TextBaseline.alphabetic,
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
                    padding: const EdgeInsets.only(bottom: 14.0),
                    child: Text(
                      widget.label!,
                      style: GdgTheme.of(context)
                          .textTheme
                          .label1
                          .copyWith(color: Colors.black.withOpacity(0.85)),
                    ),
                  ),
                Container(
                  decoration: BoxDecoration(
                    color: boxColor(),
                    border: boxBorder(focused),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 17,
                    vertical: 12,
                  ),
                  child: TextField(
                    enabled: widget.enabled,
                    controller: effectiveController,
                    focusNode: effectiveFocusNode,
                    keyboardType: widget.keyboardType,
                    textInputAction: widget.textInputAction,
                    style: textStyle(context, focused),
                    maxLength: widget.maxLength,
                    onChanged: widget.onChanged,
                    cursorColor: widget.cursorColor,
                    cursorHeight: 13,
                    maxLines: widget.maxLines,
                    scrollPadding: EdgeInsets.zero,
                    cursorWidth: widget.cursorWidth,
                    decoration: effectiveDecoration.copyWith(
                      filled: false,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintStyle: textStyle(context, focused),
                    ),
                  ).withScrollbar(widget.scrollBarVisiblity),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
