import 'dart:io';

import 'package:alfred_cli/src/models/feature_generated.dart';
import 'package:alfred_cli/src/utils/utils.dart';
import 'package:path/path.dart';

import '../utils/output_utils.dart' as output;

Future createFile({
  required String path,
  //Domain
  required Function(FeatureGenerated) generateEntity,
  required Function(FeatureGenerated) generateRepository,
  required Function(FeatureGenerated) generateError,
  required Function(FeatureGenerated) generateUseCase,

  //Data
  required Function(FeatureGenerated) generateModel,
  required Function(FeatureGenerated) generateDatasource,
  required Function(FeatureGenerated) generateRepositoryImpl,

  //Presentation
  required Function(FeatureGenerated) generatePage,
  required Function(FeatureGenerated) generateController,
  required Function(FeatureGenerated) generateModule,
}) async {
  output.msg('OK, Sir');
  output.msg('Creating feature...');

  path = path.replaceAll('\\', '/').replaceAll('\"', '');
  if (path.startsWith('/')) path = path.substring(1);
  if (path.endsWith('/')) path = path.substring(0, path.length - 1);

  path = libPath('features/$path');

  if (mainDirectory.isNotEmpty) {
    path = path.replaceAll('features/$mainDirectory', 'features/');
  }

  final dir = Directory(path).parent;

  var name = basename(path);
  var folderPath = '${dir.path}/$name/';

  //Creates Entity
  generateEntityFiles(folderPath, name, generateEntity);

  //Creates error
  generateErrorFiles(folderPath, name, generateError);

  //Creates repository
  generateRepositoryFiles(folderPath, name, generateRepository);

  //Creates Usecases
  generateUsecaseFiles(folderPath, name, generateUseCase);

  //Creates Model
  generateModelFiles(folderPath, name, generateModel);

  //Creates Datasource
  generateDatasourceFiles(folderPath, name, generateDatasource);

  //Creates RepositoryImpl
  generateRepositoriesImplFiles(folderPath, name, generateRepositoryImpl);

  //Creates Page
  generatePageFiles(folderPath, name, generatePage);

  //Creates Controller
  generateControllerFiles(folderPath, name, generateController);

  //Creates Module
  generateModuleFiles(folderPath, name, generateModule);
}

// =========================================== SubMethods

//Format file
void formatFile(File file) {
  Process.runSync('flutter', ['format', file.absolute.path], runInShell: true);
}

void generateEntityFiles(
    String folderPath, String name, Function(FeatureGenerated) template) {
  final fileEntity = File('${folderPath}domain/entities/$name.dart');

  if (fileEntity.existsSync()) {
    output.error('already exists feature $name');
    exit(1);
  }

  fileEntity.createSync(recursive: true);
  output.success('File ${fileEntity.path} created');

  fileEntity.writeAsStringSync(template(FeatureGenerated(
    packageName: name,
    name: formatName(name),
  )));

  formatFile(fileEntity);
}

void generateRepositoryFiles(
    String folderPath, String name, Function(FeatureGenerated) template) {
  final file =
      File('${folderPath}domain/repositories/i${name}_repository.dart');

  if (file.existsSync()) {
    output.error('already exists feature i${name}_repository');
    exit(1);
  }

  file.createSync(recursive: true);
  output.success('File ${file.path} created');

  file.writeAsStringSync(template(FeatureGenerated(
    packageName: name,
    name: formatName(name),
  )));

  formatFile(file);
}

void generateErrorFiles(
    String folderPath, String name, Function(FeatureGenerated) template) {
  final file = File('${folderPath}domain/errors/${name}_errors.dart');

  if (file.existsSync()) {
    output.error('already exists feature ${name}_errors');
    exit(1);
  }

  file.createSync(recursive: true);
  output.success('File ${file.path} created');

  file.writeAsStringSync(template(FeatureGenerated(
    packageName: name,
    name: formatName(name),
  )));

  formatFile(file);
}

void generateUsecaseFiles(
    String folderPath, String name, Function(FeatureGenerated) template) {
  final file =
      File('${folderPath}domain/usecases/${name}_generated_usecase.dart');

  if (file.existsSync()) {
    output.error('already exists feature ${name}_generated_usecase');
    exit(1);
  }

  file.createSync(recursive: true);
  output.success('File ${file.path} created');

  file.writeAsStringSync(template(FeatureGenerated(
    packageName: name,
    name: formatName(name),
  )));

  formatFile(file);
}

void generateModelFiles(
    String folderPath, String name, Function(FeatureGenerated) template) {
  final file = File('${folderPath}data/models/${name}_model.dart');

  if (file.existsSync()) {
    output.error('already exists feature ${name}_model');
    exit(1);
  }

  file.createSync(recursive: true);
  output.success('File ${file.path} created');

  file.writeAsStringSync(template(FeatureGenerated(
    packageName: name,
    name: formatName(name),
  )));

  formatFile(file);
}

void generateDatasourceFiles(
    String folderPath, String name, Function(FeatureGenerated) template) {
  final file = File('${folderPath}data/datasource/${name}_datasource.dart');

  if (file.existsSync()) {
    output.error('already exists feature ${name}_datasource');
    exit(1);
  }

  file.createSync(recursive: true);
  output.success('File ${file.path} created');

  file.writeAsStringSync(template(FeatureGenerated(
    packageName: name,
    name: formatName(name),
  )));

  formatFile(file);
}

void generateRepositoriesImplFiles(
    String folderPath, String name, Function(FeatureGenerated) template) {
  final file =
      File('${folderPath}data/repositories/${name}_repository_impl.dart');

  if (file.existsSync()) {
    output.error('already exists feature ${name}_repository_impl');
    exit(1);
  }

  file.createSync(recursive: true);
  output.success('File ${file.path} created');

  file.writeAsStringSync(template(FeatureGenerated(
    packageName: name,
    name: formatName(name),
  )));

  formatFile(file);
}

void generatePageFiles(
    String folderPath, String name, Function(FeatureGenerated) template) {
  final file = File('${folderPath}presentation/${name}_page.dart');

  if (file.existsSync()) {
    output.error('already exists feature ${name}__page');
    exit(1);
  }

  file.createSync(recursive: true);
  output.success('File ${file.path} created');

  file.writeAsStringSync(template(FeatureGenerated(
    packageName: name,
    name: formatName(name),
  )));

  formatFile(file);
}

void generateControllerFiles(
    String folderPath, String name, Function(FeatureGenerated) template) {
  final file = File('${folderPath}presentation/${name}_controller.dart');

  if (file.existsSync()) {
    output.error('already exists feature ${name}_controller');
    exit(1);
  }

  file.createSync(recursive: true);
  output.success('File ${file.path} created');

  file.writeAsStringSync(template(FeatureGenerated(
    packageName: name,
    name: formatName(name),
  )));

  formatFile(file);
}

void generateModuleFiles(
    String folderPath, String name, Function(FeatureGenerated) template) {
  final file = File('${folderPath}presentation/${name}_module.dart');

  if (file.existsSync()) {
    output.error('already exists feature ${name}_module');
    exit(1);
  }

  file.createSync(recursive: true);
  output.success('File ${file.path} created');

  file.writeAsStringSync(template(FeatureGenerated(
    packageName: name,
    name: formatName(name),
  )));

  formatFile(file);
}
