part of '../../gdgku_design.dart';

extension _FixedHeightWidget on Widget {
  Widget withHeight(double height) {
    return SizedBox(
      height: height,
      child: Center(
        child: this,
      ),
    );
  }
}

Future<T?> showGdgModal<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool barrierDismissible = true,
  Color barrierColor = const Color(0xeeeeeeee),
  String barrierLabel = '',
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  Offset? anchorPoint,
}) {
  return showGeneralDialog(
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) => builder(context),
    barrierColor: barrierColor,
    barrierDismissible: barrierDismissible,
    barrierLabel: barrierLabel,
    useRootNavigator: useRootNavigator,
    routeSettings: routeSettings,
    anchorPoint: anchorPoint,
  );
}

enum GdgModalVariant {
  custom,
  primary,
  wideButton,
  smallIcon,
  largeIcon,
}

class GdgModal extends StatelessWidget {
  const GdgModal({
    super.key,
    this.title,
    this.description,
    this.icon,
    this.child,
    this.actions = const [],
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.actionsMainAxisAlignment,
    this.actionsMainAxisSize,
  }) : variant = GdgModalVariant.custom;

  const GdgModal.primary({
    super.key,
    this.title,
    this.description,
    this.actions = const [],
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.actionsMainAxisAlignment,
    this.actionsMainAxisSize,
  })  : icon = null,
        child = null,
        variant = GdgModalVariant.primary;

  const GdgModal.wideButton({
    super.key,
    this.title,
    this.description,
    this.actions = const [],
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.actionsMainAxisAlignment,
    this.actionsMainAxisSize,
  })  : icon = null,
        child = null,
        variant = GdgModalVariant.wideButton;

  const GdgModal.smallIcon({
    super.key,
    this.title,
    this.description,
    required this.icon,
    this.actions = const [],
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.actionsMainAxisAlignment,
    this.actionsMainAxisSize,
  })  : child = null,
        variant = GdgModalVariant.smallIcon;

  const GdgModal.largeIcon({
    super.key,
    this.title,
    required this.icon,
    this.actions = const [],
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.actionsMainAxisAlignment,
    this.actionsMainAxisSize,
  })  : description = null,
        child = null,
        variant = GdgModalVariant.largeIcon;

  final Widget? title;
  final Widget? description;
  final Widget? icon;
  final Widget? child;
  final List<Widget> actions;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? actionsMainAxisAlignment;
  final MainAxisSize? actionsMainAxisSize;

  final GdgModalVariant variant;

  @override
  Widget build(BuildContext context) {
    final iconHeight = variant == GdgModalVariant.largeIcon ? 100.0 : 50.0;
    final titleHeight = variant == GdgModalVariant.largeIcon ? 40.0 : 30.0;
    const descriptionHeight = 50.0;
    const childHeight = 50.0;

    const titleStyle = TextStyle(
      fontFamily: 'Pretendard',
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    );

    final descriptionStyle = TextStyle(
      fontFamily: 'Pretendard',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.grey.shade700,
    );

    final placeholderHeight = child == null &&
            description == null &&
            [GdgModalVariant.primary, GdgModalVariant.wideButton]
                .contains(variant)
        ? 8.0
        : 0.0;

    final children = [
      if (icon != null) icon!.withHeight(iconHeight),
      if (title != null)
        DefaultTextStyle(
          style: titleStyle,
          child: title!.withHeight(titleHeight),
        ),
      if (description != null)
        DefaultTextStyle(
          style: descriptionStyle,
          child: description!.withHeight(descriptionHeight),
        ),
      if (child != null) child!.withHeight(childHeight),
      SizedBox(height: placeholderHeight)
    ];

    final actionsAxis =
        (variant == GdgModalVariant.wideButton || actions.length == 1)
            ? Axis.vertical
            : Axis.horizontal;

    return GdgRawModal(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      // ignore: sort_child_properties_last
      children: children,
      actions: actions,
      actionsAxis: actionsAxis,
      actionsMainAxisAlignment: actionsMainAxisAlignment,
      actionsMainAxisSize: actionsMainAxisSize,
    );
  }
}

class GdgRawModal extends StatelessWidget {
  const GdgRawModal({
    super.key,
    this.constraints,
    this.backgroundColor,
    this.border,
    this.borderRadius,
    this.shadows,
    this.padding,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.children = const [],
    this.actions = const [],
    this.actionsAxis,
    this.actionsMainAxisAlignment,
    this.actionsMainAxisSize,
    this.gap,
    this.actionsGap,
  });

  final BoxConstraints? constraints;
  final Color? backgroundColor;
  final BoxBorder? border;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? shadows;
  final EdgeInsets? padding;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final List<Widget> children;
  final List<Widget> actions;
  final Axis? actionsAxis;
  final MainAxisAlignment? actionsMainAxisAlignment;
  final MainAxisSize? actionsMainAxisSize;
  final double? gap;
  final double? actionsGap;

  @override
  Widget build(BuildContext context) {
    final effectiveConstraints =
        constraints ?? const BoxConstraints(maxWidth: 320, maxHeight: 260);

    final effectiveBackgroundColor = backgroundColor ?? Colors.white;
    final effectiveBorder = border ?? Border.all(color: Colors.transparent);
    final effectiveBorderRadius = borderRadius ?? BorderRadius.circular(32);
    final effectiveShadows = shadows ??
        [
          const BoxShadow(
            blurRadius: 16,
            spreadRadius: 0,
            color: Color(0x22000000),
          )
        ];

    final effectivePadding =
        padding ?? const EdgeInsets.symmetric(vertical: 20, horizontal: 30);

    final effectiveMainAxisAlignment =
        mainAxisAlignment ?? MainAxisAlignment.start;
    final effectiveCrossAxisAlignment =
        crossAxisAlignment ?? CrossAxisAlignment.stretch;

    final effectiveGap = gap ?? 8;

    final effectiveActionsAxis = actionsAxis ?? Axis.horizontal;
    final effectiveActionsMainAxisAlignment =
        actionsMainAxisAlignment ?? MainAxisAlignment.center;
    final effectiveActionsMainAxisSize =
        actionsMainAxisSize ?? MainAxisSize.min;
    final effectiveActionsGap = actionsGap ?? 10;

    final effectiveActions = Flex(
      direction: effectiveActionsAxis,
      mainAxisSize: effectiveActionsMainAxisSize,
      mainAxisAlignment: effectiveActionsMainAxisAlignment,
      children: actions.separatedBy(SizedBox(
        width: effectiveActionsGap,
        height: effectiveActionsGap,
      )),
    );

    return Center(
      child: ConstrainedBox(
        constraints: effectiveConstraints,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: effectiveBackgroundColor,
            borderRadius: effectiveBorderRadius,
            border: effectiveBorder,
            boxShadow: effectiveShadows,
          ),
          child: Padding(
            padding: effectivePadding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: effectiveMainAxisAlignment,
              crossAxisAlignment: effectiveCrossAxisAlignment,
              children: [
                ...children,
                effectiveActions,
              ].separatedBy(SizedBox(height: effectiveGap)),
            ),
          ),
        ),
      ),
    );
  }
}
