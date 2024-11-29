import 'package:flutter/material.dart';

class GdgButton extends StatelessWidget {
  const GdgButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// import 'package:flutter/material.dart';

// import 'package:gdg_dsgn/util.dart';

// enum GdgButtonVariant {
//   primary,
//   large,
//   icon,
// }

// class GdgButton extends StatefulWidget {
//   const GdgButton({
//     super.key,
//     required this.onPressed,
//     this.child,
//     this.icon,
//   }) : isLarge = false;

//   const GdgButton.large({
//     super.key,
//     this.onPressed,
//     this.child,
//     this.icon,
//     this.isLarge = true,
//   });

//   final void Function()? onPressed;
//   final Widget? child;
//   final Widget? icon;
//   final bool isLarge;

//   @override
//   State<GdgButton> createState() => _GdgButtonState();
// }

// class _GdgButtonState extends State<GdgButton> {
//   bool isPressed = false;

//   double? width(GdgButtonVariant variant) {
//     switch (variant) {
//       case GdgButtonVariant.icon:
//         return 48;
//       default:
//         return null;
//     }
//   }

//   double height(GdgButtonVariant variant) => 48;

//   EdgeInsetsGeometry padding(GdgButtonVariant variant) {
//     switch (variant) {
//       case GdgButtonVariant.primary:
//         return EdgeInsets.symmetric(
//           vertical: 14.pxToDP,
//           horizontal: 20.pxToDP,
//         );
//       case GdgButtonVariant.large:
//         return EdgeInsets.symmetric(vertical: 14.5.pxToDP);
//       case GdgButtonVariant.icon:
//         return EdgeInsets.all(10.pxToDP);
//     }
//   }

//   Widget _buildChild(
//     Widget? child,
//     Widget? icon,
//     GdgButtonVariant variant,
//   ) {
//     return switch (variant) {
//       GdgButtonVariant.primary => icon == null
//           ? child!
//           : Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [icon, SizedBox(width: 8.0.pxToDP), child!],
//             ),
//       GdgButtonVariant.large => Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (icon != null) icon,
//             if (icon != null) SizedBox(width: 8.0.pxToDP),
//             child!,
//           ],
//         ),
//       GdgButtonVariant.icon => icon!,
//     };
//   }

//   @override
//   Widget build(BuildContext context) {
//     assert(
//       widget.child != null || widget.icon != null,
//       "button must have child or icon",
//     );
//     assert(
//       !(widget.isLarge && widget.child == null),
//       "large button must have child",
//     );

//     GdgButtonVariant variant = GdgButtonVariant.primary;
//     if (widget.isLarge) {
//       variant = GdgButtonVariant.large;
//     } else if (widget.icon != null && widget.child == null) {
//       variant = GdgButtonVariant.icon;
//     }

//     Widget child = _buildChild(widget.child, widget.icon, variant);

//     return SizedBox(
//       width: width(variant),
//       height: height(variant),
//       child: GestureDetector(
//         onTap: widget.onPressed,
//         onTapDown: (details) {
//           setState(() {
//             isPressed = true;
//           });
//         },
//         onTapUp: (details) {
//           setState(() {
//             isPressed = false;
//           });
//         },
//         child: Opacity(
//           opacity: isPressed ? 0.5 : 1,
//           child: Container(
//             decoration: BoxDecoration(
//               color: Theme.of(context).primaryColor,
//               borderRadius: BorderRadius.circular(100),
//             ),
//             child: Padding(
//               padding: padding(variant),
//               child: child,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
