# gdg_dsgn

Google Developers Group on Korea University의 Design System for Flutter 프로젝트 입니다.

> (https://gdg-ku.github.io/GDG-KUDS-Flutter/) 에서 직접 확인할 수 있습니다.

## Getting Started

```sh
git clone https://github.com/gdsc-ku/GDG-KUDS-Flutter
cd GDG-KUDS-Flutter
flutter pub get
```

### Component 추가하기

lib>ui>component 에 새로운 컴포넌트를 추가하거나 수정할 수 있습니다.

새로운 컴포넌트 추가 후 widgetbook에도 추가가 필요합니다.

widgetbook>lib>component(root 프로젝트와 동일한 디렉터리 구조를 가지고 있습니다)에서 같은 이름의 .dart파일 생성 후,

```dart
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:gdgku_design/src/foundation/gdg_color_scheme.dart';

@widgetbook.UseCase(name: 'Default', type: NewWidget)
Widget buildNewWidgetUseCase(BuildContext context) {
  return const NewWidget();
}

```

해당 코드를 추가 해 줍니다. widgetbook의 `knob`기능이 필요하다면, (https://docs.widgetbook.io/knobs) 해당 사이트를 참고 해 주세요.

```sh
# from root directory
cd widgetbook
dart run build_runner build
```

해당 명령어를 수행 해 주어야 widgetbook에서 확인 가능합니다.

## For Contribution

이하에 서술하는 Coding Convention과 Project Structure를 잘 지켜주셔야 합니다.

또한 개발한 코드에 대해 test를 반드시 작성 후 pass해야 합니다.

## Project Structure

```
📦lib
┣ 📂ui
┃ ┣ 📂component
┃ ┗ 📂foundation
┃ ┃ ┣ 📜gdg_color_scheme.dart
┃ ┃ ┗ 📜gdg_typography.dart
┣ 📜main.dart
┗ 📜util.dart
📦widgetbook
```

## Coding Convention

### Indentation

들여쓰기는 공백 2개를 사용하며, 탭 문자를 사용하지 않습니다. 중첩된 블록에서 들여쓰기를 적용합니다.

### Naming

변수, 함수, 클래스, 메소드 등의 이름을 카멜 케이스 (camelCase)로 작성합니다.

ex) myVariable, calculateTotal, MyClass와 같은 형식을 따릅니다.

### File

파일명은 소문자와 밑줄을 사용합니다.

### Writings

한 클래스나 파일에 150줄이 넘어가면 세부 클래스나 함수로 분리합니다.
