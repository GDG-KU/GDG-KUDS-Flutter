part of '../../gdgku_design.dart';

class GdgSelectItem<T> extends StatefulWidget {
  const GdgSelectItem({
    super.key,
    required this.optionBuilder,
    required this.onSelected,
    required this.isFirst,
    required this.isLast,
    required this.option,
    required this.color,
  });

  final Widget Function(T option)? optionBuilder;
  final ValueChanged<T> onSelected;
  final bool isFirst;
  final bool isLast;
  final T option;
  final GdgColor color;

  @override
  State<GdgSelectItem> createState() => _GdgSelectItemState<T>();
}

class _GdgSelectItemState<T> extends State<GdgSelectItem<T>> {
  bool isPressed = false;
  Widget Function(T option) get effectiveOptionBuilder =>
      widget.optionBuilder ?? _defaultOptionBuilder;

  Color? color() {
    Color? color;
    if (isPressed) {
      color = widget.color[100];
      if (widget.color == GdgColors.primary) {
        color = widget.color[200];
      }
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onSelected(widget.option),
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: DefaultTextStyle(
        style: GdgTheme.of(context).textTheme.body1Medium.copyWith(
              color:
                  isPressed ? GdgColors.primary[800] : GdgColors.primary[600],
            ),
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: color(),
            borderRadius: BorderRadius.vertical(
              top: widget.isFirst ? const Radius.circular(8) : Radius.zero,
              bottom: widget.isLast ? const Radius.circular(8) : Radius.zero,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            child: effectiveOptionBuilder(
              widget.option,
            ),
          ),
        ),
      ),
    );
  }
}
