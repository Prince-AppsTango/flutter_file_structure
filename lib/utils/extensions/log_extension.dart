import 'dart:developer';
import '../constants/app_validations.dart';

extension LogExtension on String {
  void logWithLocation() {
    final currentStack = StackTrace.current;
    final formattedStack = currentStack.toString().split("\n")[1];
    final match = RegExp(AppValidations.fileRegex).firstMatch(formattedStack);

    if (match != null) {
      final file = match.namedGroup('file');
      final line = match.namedGroup('line');
      final column = match.namedGroup('column');
      log('$this (Location: $file:$line:$column)');
    } else {
      log(this);
    }
  }
}
