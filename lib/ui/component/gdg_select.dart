import 'package:flutter/material.dart';
import 'package:gdgku_design/ui/theme/gdg_color_scheme.dart';
import 'package:gdgku_design/ui/theme/gdg_theme.dart';

part 'gdg_select_item.dart';

Widget _defaultOptionBuilder<T>(T option) => Text(option.toString());

class GdgSelect<T> extends StatefulWidget {
  const GdgSelect({
    super.key,
    required this.options,
    required this.onChanged,
    this.value,
    this.hintText = "Select",
    this.optionBuilder,
    this.controller,
    this.color = GdgColors.primary,
  });

  final String hintText;
  final List<T> options;
  final Widget Function(T option)? optionBuilder;
  final OverlayPortalController? controller;
  final ValueChanged<T> onChanged;
  final GdgColor color;
  final T? value;

  @override
  State<GdgSelect> createState() => _GdgSelectState<T>();
}

class _GdgSelectState<T> extends State<GdgSelect<T>> {
  final _link = LayerLink();
  final hasFocus = ValueNotifier(false);

  OverlayPortalController? _controller;
  OverlayPortalController get effectiveController =>
      widget.controller ?? _controller!;

  void onFocusChange() => hasFocus.value = effectiveController.isShowing;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = OverlayPortalController();
    }
  }

  @override
  void dispose() {
    hasFocus.dispose();
    super.dispose();
  }

  void onToggleSelect() {
    effectiveController.toggle();
    hasFocus.value = effectiveController.isShowing;
  }

  void onItemSelect(T option) {
    effectiveController.hide();
    widget.onChanged(option);
    hasFocus.value = false;
  }

  Widget overlayBuilder({
    required bool hasFocus,
    required BoxConstraints constraints,
    required BuildContext context,
  }) {
    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: onToggleSelect,
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        CompositedTransformFollower(
          link: _link,
          targetAnchor: Alignment.bottomCenter,
          followerAnchor: Alignment.topCenter,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              constraints: constraints,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var i = 0; i < widget.options.length; i++)
                    GdgSelectItem<T>(
                      optionBuilder: widget.optionBuilder,
                      isFirst: i == 0,
                      isLast: i == widget.options.length - 1,
                      option: widget.options[i],
                      color: widget.color,
                      onSelected: onItemSelect,
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Border selectBorder(bool hasFocus) {
    var color = switch (widget.color) {
      GdgColors.primary => hasFocus ? widget.color[800] : widget.color[500],
      _ => hasFocus ? widget.color[500] : GdgColors.primary[500],
    };

    return Border.all(color: color!);
  }

  TextStyle selectTextStyle(bool hasFocus) {
    var color = GdgColors.primary[500];
    if (widget.value != null) {
      color = GdgColors.primary[800];
    }
    return GdgTheme.of(context).textTheme.body1Medium.copyWith(
          color: color,
          height: 1.25,
        );
  }

  Widget childBuilder({
    required bool hasFocus,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: onToggleSelect,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 9,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: selectBorder(hasFocus),
        ),
        child: Row(
          children: [
            Expanded(
              child: DefaultTextStyle(
                style: selectTextStyle(hasFocus),
                child: widget.value != null
                    ? (widget.optionBuilder ?? _defaultOptionBuilder).call(
                        widget.value as T,
                      )
                    : Text(widget.hintText, maxLines: 1),
              ),
            ),
            Transform.rotate(
              angle: 3.14 / 2,
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 14,
                color: GdgColors.primary[500],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.value != null) {
      assert(
        widget.options.contains(widget.value),
        "The value provided is not in the options list",
      );
    }
    assert(
      widget.options.isNotEmpty,
      "The options list cannot be empty",
    );

    return ValueListenableBuilder(
      valueListenable: hasFocus,
      builder: (context, focused, _) {
        return LayoutBuilder(builder: (context, constraints) {
          return CompositedTransformTarget(
            link: _link,
            child: OverlayPortal(
              controller: effectiveController,
              overlayChildBuilder: (_) => overlayBuilder(
                hasFocus: focused,
                constraints: constraints,
                context: context,
              ),
              child: childBuilder(
                hasFocus: focused,
                context: context,
              ),
            ),
          );
        });
      },
    );
  }
}
