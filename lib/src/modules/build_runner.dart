import 'dart:io';
import 'dart:convert';
import 'package:ansicolor/ansicolor.dart';

import '../utils/output_utils.dart' as output;

void buildRunnerMobx() async {
  print('Just a minute, Sir');
  print('Running...');
  final process = await Process.start('flutter',
      ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs'],
      runInShell: true);

  final exitCode = await process.exitCode;

  if (exitCode == 65) {
    output.error('Alfred couldn`t run build_runner build');
  } else {
    await for (var line in process.stdout
        .transform(utf8.decoder)
        .map(AnsiPen()..green(bold: true))) {
      print(line);
    }
  }
}
