import 'package:flutter/material.dart';
import 'package:gdg_dsgn/ui/theme/theme.dart';

class GdgTypographyView extends StatelessWidget {
  const GdgTypographyView({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final textTheme = GdgTheme.of(context).textTheme;

    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("GDG KU Typography", style: textTheme.h4),
              const Divider(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Headline 1", style: textTheme.caption),
                  Text(text, style: textTheme.h1),
                ],
              ),
              const Divider(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Headline 2", style: textTheme.caption),
                  Text(text, style: textTheme.h2),
                ],
              ),
              const Divider(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Headline 3", style: textTheme.caption),
                  Text(text, style: textTheme.h3),
                ],
              ),
              const Divider(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Headline 4", style: textTheme.caption),
                  Text(text, style: textTheme.h4),
                ],
              ),
              const Divider(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Headline 5", style: textTheme.caption),
                  Text(text, style: textTheme.h5),
                ],
              ),
              const Divider(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Body1 Medium", style: textTheme.caption),
                  Text(text, style: textTheme.body1Medium),
                ],
              ),
              const Divider(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Body2 Medium", style: textTheme.caption),
                  Text(text, style: textTheme.body2Medium),
                ],
              ),
              const Divider(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Link Medium", style: textTheme.caption),
                  Text(text, style: textTheme.linkMedium),
                ],
              ),
              const Divider(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Body1 Small", style: textTheme.caption),
                  Text(text, style: textTheme.body1Small),
                ],
              ),
              const Divider(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Body2 Small", style: textTheme.caption),
                  Text(text, style: textTheme.body2Small),
                ],
              ),
              const Divider(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Link Small", style: textTheme.caption),
                  Text(text, style: textTheme.linkSmall),
                ],
              ),
              const Divider(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Caption", style: textTheme.caption),
                  Text(text, style: textTheme.caption),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
