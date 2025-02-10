import 'package:flutter/material.dart';
import 'package:gdgku_design/ui/theme/gdg_color_scheme.dart';

class GdgSelect extends StatefulWidget {
  const GdgSelect({
    super.key,
    required this.width,
    required this.options,
    this.hintText = "Select",
  });

  final double width;
  final String hintText;
  final List<Widget> options;

  @override
  State<GdgSelect> createState() => _GdgSelectState();
}

class _GdgSelectState extends State<GdgSelect> {
  final _controller = OverlayPortalController();
  final _link = LayerLink();

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _link,
      child: OverlayPortal(
        controller: _controller,
        overlayChildBuilder: (_) {
          return Stack(
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onTap: () => _controller.hide(),
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
                    constraints: BoxConstraints(
                      maxWidth: widget.width,
                      minWidth: widget.width,
                      maxHeight: 260,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: DefaultTextStyle(
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: GdgColors.primary.shade600,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (var option in widget.options)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 9,
                              ),
                              child: option,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        child: GestureDetector(
          onTap: () {
            _controller.toggle();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 9,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: GdgColors.primary.shade800,
              ),
            ),
            width: widget.width,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.hintText,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: GdgColors.primary.shade600,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: 3.14 / 2,
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 14,
                    color: GdgColors.primary.shade600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
