import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:taro_leaf_blight/resources/resources.dart';

void main() {
  test('assets assets test', () {
    expect(File(Assets.avatar).existsSync(), isTrue);
  });
}
