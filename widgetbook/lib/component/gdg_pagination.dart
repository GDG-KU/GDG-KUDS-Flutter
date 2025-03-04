import 'package:flutter/material.dart';
import 'package:gdgku_design/gdgku_design.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/knob/color_knob.dart';

@widgetbook.UseCase(name: 'Default', type: GdgPagination)
Widget buildNewWidgetUseCase(BuildContext context) {
  final maxPages = context.knobs.int.slider(
    label: 'total number of pages',
    initialValue: 7,
    min: 3,
    max: 21,
  );
  final visiblePages = context.knobs.int.slider(
    label: 'number of visible pages',
    initialValue: 5,
    min: 3,
    max: 21,
  );
  final color = context.knobs.gdgColor(label: "color");
  return Padding(
    padding: const EdgeInsets.all(17.0),
    child: Center(
      child: _GdgPagination(
        maxPages,
        visiblePages,
        color,
      ),
    ),
  );
}

class _GdgPagination extends StatefulWidget {
  const _GdgPagination(
    this.maxPages,
    this.maxVisiblePages,
    this.color,
  );

  final int maxPages;
  final int maxVisiblePages;
  final GdgColor color;

  @override
  State<_GdgPagination> createState() => _GdgPaginationState();
}

class _GdgPaginationState extends State<_GdgPagination> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return GdgPagination(
      currentPage: currentPage,
      totalPages: widget.maxPages,
      onPageChanged: (page) {
        setState(() {
          currentPage = page;
        });
      },
      maxVisiblePages: widget.maxVisiblePages,
      showSkipToFirstPage: true,
      showSkipToLastPage: true,
      color: widget.color,
    );
  }
}
