// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _i1;
import 'package:widgetbook_workspace/component/gdg_button.dart' as _i2;
import 'package:widgetbook_workspace/foundation/gdg_color_scheme_view.dart'
    as _i3;
import 'package:widgetbook_workspace/foundation/gdg_typography.dart' as _i4;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'ui',
    children: [
      _i1.WidgetbookFolder(
        name: 'component',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'GdgButton',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i2.buildNewWidgetUseCase,
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
              builder: _i3.buildGdgTypographyUseCase,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'GdgTypography',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i4.buildGdgTypographyUseCase,
            ),
          ),
        ],
      ),
    ],
  )
];
