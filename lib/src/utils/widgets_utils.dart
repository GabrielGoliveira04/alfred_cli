import 'dart:io';

import 'package:alfred_cli/src/models/widget_generated.dart';
import 'package:alfred_cli/src/utils/utils.dart';
import 'package:path/path.dart';

import '../utils/output_utils.dart' as output;

Future createFile({
  required String path,
  required String type,
  required bool haveWidgetBehaviour,
  required Function(WidgetGenerated) generateWidget,
  required Function(WidgetGenerated) generateTest,
}) async {
  output.msg('Creating $type...');

  path = path.replaceAll('\\', '/').replaceAll('\"', '');
  if (path.startsWith('/')) path = path.substring(1);
  if (path.endsWith('/')) path = path.substring(0, path.length - 1);

  path = libPath('widgets/$type/$path');

  if (mainDirectory.isNotEmpty) {
    path = path.replaceAll('widgets/$mainDirectory', 'widgets/');
  }

  Directory dir;
  if (type == 'atoms' || type == 'molecules' || type == 'organisms' || type == 'template') {
    dir = Directory(path).parent;
  } else {
    dir = Directory(path);
  }

  var name = basename(path);
  var folderPath = '${dir.path}/$name/$name';

  ///CREATE WIDGET
  File fileComponent;
  fileComponent = File('${folderPath}_widget.dart');

  if (fileComponent.existsSync()) {
    output.error('already exists a $type $name');
    exit(1);
  }
  fileComponent.createSync(recursive: true);
  output.success('File ${fileComponent.path} created');

  fileComponent.writeAsStringSync(generateWidget(WidgetGenerated(
      packageName: name, name: formatName(name), type: formatName(type), haveWidgetBehaviour: haveWidgetBehaviour)));

  formatFile(fileComponent);

  createTest(
      name: name,
      type: type,
      content: generateTest(WidgetGenerated(packageName: name, name: formatName(name), type: type)));
}

//Format file
void formatFile(File file) {
  Process.runSync('flutter', ['format', file.absolute.path], runInShell: true);
}

//Creating widget test
void createTest({required String name, required String type, required String content}) {
  var dir = Directory('${mainDirectory}test/$type');
  if (!dir.existsSync()) {
    dir.createSync();
  }

  var file = File('${dir.path}/${name}_widget_test.dart');
  if (!file.existsSync()) {
    file.writeAsStringSync(content);
    output.success('File ${file.path} created');
  } else {
    output.warn('${formatName(name)} exist!');
  }
}
