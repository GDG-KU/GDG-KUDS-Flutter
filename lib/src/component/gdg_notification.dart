part of '../../gdgku_design.dart';

enum GdgNotificationVariant {
  primary(Icons.notifications, GdgColors.primary),
  info(Icons.info, GdgColors.blue),
  success(Icons.check_circle, GdgColors.green),
  warning(Icons.warning, GdgColors.yellow),
  error(Icons.cancel, GdgColors.red);

  final IconData icon;
  final GdgColor color;

  const GdgNotificationVariant(this.icon, this.color);
}

Future<void> showGdgNotification({
  required BuildContext context,
  required WidgetBuilder builder,
  bool useRootOverlay = false,
  Duration duration = const Duration(seconds: 4),
  Curve curve = Curves.easeOut,
  bool dismissible = true,
  Alignment alignment = Alignment.center,
}) {
  final completer = Completer();
  final overlay = Overlay.of(context, rootOverlay: useRootOverlay);
  OverlayEntry? entry;

  entry = OverlayEntry(builder: (_) {
    return _GdgNotificationContainer(
      onDismiss: () {
        entry?.remove();
        completer.complete();
      },
      duration: duration,
      curve: curve,
      dismissible: dismissible,
      alignment: alignment,
      builder: builder,
    );
  });
  overlay.insert(entry);
  return completer.future;
}

class _GdgNotificationContainer extends StatefulWidget {
  const _GdgNotificationContainer({
    required this.builder,
    required this.onDismiss,
    required this.duration,
    required this.curve,
    required this.dismissible,
    required this.alignment,
  });

  final WidgetBuilder builder;
  final VoidCallback onDismiss;
  final Duration duration;
  final Curve curve;
  final bool dismissible;
  final Alignment alignment;

  @override
  _GdgNotificationContainerState createState() =>
      _GdgNotificationContainerState();
}

class _GdgNotificationContainerState extends State<_GdgNotificationContainer> {
  final positionKey = GlobalKey();
  bool isVisible = false;
  bool isRemoved = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => isVisible = true);
    });
    Future.delayed(widget.duration, () {
      if (isRemoved) return;
      setState(() => isVisible = false);
      Future.delayed(const Duration(milliseconds: 200), () {
        widget.onDismiss.call();
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        key: positionKey,
        alignment: widget.alignment,
        child: AnimatedOpacity(
          opacity: isVisible ? 1 : 0,
          curve: widget.curve,
          duration: const Duration(milliseconds: 200),
          child: Dismissible(
            key: UniqueKey(),
            onDismissed: (_) {
              isRemoved = true;
              widget.onDismiss.call();
            },
            child: widget.builder(context),
          ),
        ),
      ),
    );
  }
}

class GdgNotification extends StatelessWidget {
  const GdgNotification({
    super.key,
    this.isFilled = false,
    this.variant = GdgNotificationVariant.primary,
    this.icon,
    this.margin = const EdgeInsets.all(17),
    required this.title,
    required this.content,
  });

  final bool isFilled;
  final GdgNotificationVariant variant;
  final IconData? icon;
  final String title;
  final Widget content;
  final EdgeInsetsGeometry? margin;

  factory GdgNotification.info({
    required String title,
    required Widget content,
    bool isFilled = false,
    IconData? icon,
    EdgeInsetsGeometry? margin,
  }) {
    return GdgNotification(
      title: title,
      content: content,
      isFilled: isFilled,
      icon: icon,
      margin: margin,
      variant: GdgNotificationVariant.info,
    );
  }

  factory GdgNotification.success({
    required String title,
    required Widget content,
    bool isFilled = false,
    IconData? icon,
    EdgeInsetsGeometry? margin,
  }) {
    return GdgNotification(
      title: title,
      content: content,
      isFilled: isFilled,
      icon: icon,
      margin: margin,
      variant: GdgNotificationVariant.success,
    );
  }

  factory GdgNotification.warning({
    required String title,
    required Widget content,
    bool isFilled = false,
    IconData? icon,
    EdgeInsetsGeometry? margin,
  }) {
    return GdgNotification(
      title: title,
      content: content,
      isFilled: isFilled,
      icon: icon,
      margin: margin,
      variant: GdgNotificationVariant.warning,
    );
  }

  factory GdgNotification.error({
    required String title,
    required Widget content,
    bool isFilled = false,
    IconData? icon,
    EdgeInsetsGeometry? margin,
  }) {
    return GdgNotification(
      title: title,
      content: content,
      isFilled: isFilled,
      icon: icon,
      margin: margin,
      variant: GdgNotificationVariant.error,
    );
  }

  @override
  Widget build(BuildContext context) {
    final effectiveIcon = icon ?? variant.icon;
    final effectiveBackgroundColor = switch (variant.color) {
      GdgColors.primary => isFilled ? variant.color[600] : Colors.white,
      _ => isFilled ? variant.color[100] : Colors.white,
    };
    final effectiveTitleColor = switch (variant.color) {
      GdgColors.primary => isFilled ? Colors.white : variant.color[800],
      _ => isFilled ? GdgColors.primary[800] : variant.color[500],
    };
    final effectiveSubTextColor = switch (variant.color) {
      GdgColors.primary => isFilled ? variant.color[400] : variant.color[600],
      _ => GdgColors.primary[600],
    };

    final effectiveIconColor = switch (variant.color) {
      GdgColors.primary => isFilled ? Colors.white : variant.color[800],
      _ => variant.color[500],
    };

    return Container(
      margin: margin,
      constraints: const BoxConstraints(
        minHeight: 82,
      ),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 17,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 21,
              height: 21,
              child: Icon(
                effectiveIcon,
                color: effectiveIconColor,
                size: 21,
                fill: 1.0,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: effectiveTitleColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(height: 8.6),
                  DefaultTextStyle(
                    style: TextStyle(
                      color: effectiveSubTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                    child: content,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
