import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gdg_dsgn/util.dart';

class GdgColorScheme extends StatelessWidget {
  const GdgColorScheme({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.getColorScheme;
    final colors = [
      (colorScheme.background, "Background"),
      (colorScheme.foreground, "Foreground"),
      (colorScheme.card, "Card"),
      (colorScheme.cardForeground, "Card Foreground"),
      (colorScheme.popover, "Popover"),
      (colorScheme.popoverForeground, "Popover Foreground"),
      (colorScheme.primary, "Primary"),
      (colorScheme.primaryForeground, "Primary Foreground"),
      (colorScheme.secondary, "Secondary"),
      (colorScheme.secondaryForeground, "Secondary Foreground"),
      (colorScheme.muted, "Muted"),
      (colorScheme.mutedForeground, "Muted Foreground"),
      (colorScheme.accent, "Accent"),
      (colorScheme.accentForeground, "Accent Foreground"),
      (colorScheme.destructive, "Destructive"),
      (colorScheme.destructiveForeground, "Destructive Foreground"),
      (colorScheme.border, "Border"),
      (colorScheme.input, "Input"),
      (colorScheme.ring, "Ring"),
      (colorScheme.selection, "Selection"),
    ];
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(17.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                Clipboard.setData(
                  ClipboardData(
                    text: "0x${colors[index].$1.value.toRadixString(16)}",
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: 80,
                      decoration: BoxDecoration(
                        color: colors[index].$1,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: colorScheme.border,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(1, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 17),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            colors[index].$2,
                            style: context.getTextTheme.h4,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                "0x${colors[index].$1.value.toRadixString(16)}",
                                style: context.getTextTheme.small,
                              ),
                              const SizedBox(width: 3),
                              Icon(
                                Icons.copy,
                                size: 16,
                                color: colorScheme.primary,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: colors.length,
        ),
      ),
    );
  }
}
