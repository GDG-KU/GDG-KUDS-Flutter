// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _i1;
import 'package:widgetbook_workspace/component/gdg_badge.dart' as _i2;
import 'package:widgetbook_workspace/component/gdg_button.dart' as _i3;
import 'package:widgetbook_workspace/component/gdg_checkbox.dart' as _i4;
import 'package:widgetbook_workspace/component/gdg_input.dart' as _i5;
import 'package:widgetbook_workspace/component/gdg_tag.dart' as _i6;
import 'package:widgetbook_workspace/component/gdg_textarea.dart' as _i7;
import 'package:widgetbook_workspace/example/gdg_example.dart' as _i8;
import 'package:widgetbook_workspace/foundation/gdg_color_scheme_view.dart'
    as _i9;
import 'package:widgetbook_workspace/foundation/gdg_typography.dart' as _i10;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'ui',
    children: [
      _i1.WidgetbookFolder(
        name: 'component',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'GdgBadge',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i2.buildNewWidgetUseCase,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'GdgButton',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i3.buildNewWidgetUseCase,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'GdgCheckbox',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i4.buildNewWidgetUseCase,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'GdgInput',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i5.buildNewWidgetUseCase,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'GdgTag',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i6.buildNewWidgetUseCase,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'GdgTextarea',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i7.buildNewWidgetUseCase,
            ),
          ),
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'example',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'GdgExample',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i8.buildNewWidgetUseCase,
            ),
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'foundation',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'GdgColorSchemeView',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i9.buildGdgTypographyUseCase,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'GdgTypographyView',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i10.buildGdgTypographyUseCase,
            ),
          ),
        ],
      ),
    ],
  )
];
