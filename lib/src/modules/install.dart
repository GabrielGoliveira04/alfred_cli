import 'dart:io';
import 'dart:convert';
import 'package:ansicolor/ansicolor.dart';

import '../utils/output_utils.dart' as output;

void install(String package) async {
  print('Installing...');
  final process =
      await Process.start('flutter', ['pub', 'add', package], runInShell: true);

  final exitCode = await process.exitCode;

  if (exitCode == 65) {
    output.error('This plugin is already installed');
  } else {
    await for (var line in process.stdout
        .transform(utf8.decoder)
        .map(AnsiPen()..green(bold: true))) {
      print(line);
    }
  }
}
