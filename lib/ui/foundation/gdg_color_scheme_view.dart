import 'package:flutter/material.dart';
import 'package:gdgku_design/ui/theme/gdg_color_scheme.dart';
import 'package:gdgku_design/ui/theme/gdg_theme.dart';

class GdgColorSchemeView extends StatelessWidget {
  const GdgColorSchemeView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = GdgTheme.of(context).textTheme;
    final primaries = [
      [GdgColors.primary.shade100, "100"],
      [GdgColors.primary.shade200, "200"],
      [GdgColors.primary.shade300, "300"],
      [GdgColors.primary.shade400, "400"],
      [GdgColors.primary.shade500, "500"],
      [GdgColors.primary.shade600, "600"],
      [GdgColors.primary.shade700, "700"],
      [GdgColors.primary.shade800, "800"],
      [GdgColors.primary.shade900, "900"],
    ];

    final blues = [
      [GdgColors.blue.shade100, "100"],
      [GdgColors.blue.shade300, "300"],
      [GdgColors.blue.shade500, "500"],
    ];

    final greens = [
      [GdgColors.green.shade100, "100"],
      [GdgColors.green.shade300, "300"],
      [GdgColors.green.shade500, "500"],
    ];

    final yellows = [
      [GdgColors.yellow.shade100, "100"],
      [GdgColors.yellow.shade300, "300"],
      [GdgColors.yellow.shade500, "500"],
    ];

    final reds = [
      [GdgColors.red.shade100, "100"],
      [GdgColors.red.shade300, "300"],
      [GdgColors.red.shade500, "500"],
    ];

    Widget item(List<Object> color) {
      final foregroundColor = (color[0] as Color).computeLuminance() > 0.5
          ? Colors.black
          : Colors.white;
      return Container(
        color: color[0] as Color,
        padding: const EdgeInsets.symmetric(
          horizontal: 17,
          vertical: 10,
        ),
        child: Row(
          children: [
            Text(
              "0x${(color[0] as Color).value.toRadixString(16)}",
              style: textTheme.body2Medium.copyWith(
                color: foregroundColor,
              ),
            ),
            const Spacer(),
            Text(
              color[1] as String,
              style: textTheme.body2Medium.copyWith(
                color: foregroundColor,
              ),
            ),
            const SizedBox(width: 10),
            Icon(Icons.copy, size: 16, color: foregroundColor),
          ],
        ),
      );
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(17.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: Text("Primary", style: textTheme.h3)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              sliver: SliverList.builder(
                itemBuilder: (context, index) {
                  return item(primaries[index]);
                },
                itemCount: primaries.length,
              ),
            ),
            const SliverToBoxAdapter(child: Divider(height: 30)),
            SliverToBoxAdapter(child: Text("Secondary", style: textTheme.h3)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              sliver: SliverList.builder(
                itemBuilder: (context, index) {
                  return item(blues[index]);
                },
                itemCount: blues.length,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              sliver: SliverList.builder(
                itemBuilder: (context, index) {
                  return item(greens[index]);
                },
                itemCount: greens.length,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              sliver: SliverList.builder(
                itemBuilder: (context, index) {
                  return item(yellows[index]);
                },
                itemCount: yellows.length,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              sliver: SliverList.builder(
                itemBuilder: (context, index) {
                  return item(reds[index]);
                },
                itemCount: reds.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
