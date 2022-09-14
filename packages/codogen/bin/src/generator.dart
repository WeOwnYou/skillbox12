import 'dart:io';

import 'package:dart_style/dart_style.dart';

const localizationPath = 'packages/codogen';

class Generator {
  static const _kOutput = 'env.variables.g.dart';

  final _prologue = '''
  ///DO NOT EDIT. This code is mine

  class EnvironmentalVariables{
  ''';
  final _epilogue = ' }';

  String _getProperty(String value, String propertyName) {
    final newValue = value.replaceAll(r'\', r'\\');
    return '''String get $propertyName => '$newValue';''';
  }

  void run({required int varNumber}) {
    final outputFile = '''${Directory.current.path}\\lib\\$_kOutput''';
    final output = StringBuffer()..writeln(_prologue);
    for (final entry in Platform.environment.entries.take(varNumber)) {
      output.writeln(_getProperty(entry.value, entry.key.toLowerCase()));
    }
    output.writeln(_epilogue);
    final formattedCode = DartFormatter().format(output.toString());
    File(outputFile).writeAsStringSync(formattedCode);
  }
}
