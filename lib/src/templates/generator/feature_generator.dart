import 'package:alfred_cli/src/models/feature_generated.dart';

String entityGenerator(FeatureGenerated obj) => ''' 

class ${obj.name} {
  

  ${obj.name}();
}

''';

String errorGenerator(FeatureGenerated obj) => ''' 

abstract class I${obj.name}Error {}

class Unexpected${obj.name}Error implements I${obj.name}Error {
  
  String message = 'Não foi possível obter os dados';
}

''';

String repositoryGenerator(FeatureGenerated obj) => ''' 

import 'package:dartz/dartz.dart';
import '../../domain/errors/${obj.packageName}_errors.dart';
import '../../data/models/${obj.packageName}_model.dart';

abstract class I${obj.name}Repository {
  Future<Either<I${obj.name}Error, ${obj.name}Model>> get${obj.name}();
}

''';

String usecaseGenerator(FeatureGenerated obj) => ''' 

import 'package:dartz/dartz.dart';
import '../../domain/errors/${obj.packageName}_errors.dart';
import '../../data/models/${obj.packageName}_model.dart';
import '../../domain/repositories/i${obj.packageName}_repository.dart';

class ExampleUsecase {
  final I${obj.name}Repository repository;

  ExampleUsecase(this.repository);

 Future<Either<I${obj.name}Error, ${obj.name}Model>> call() async {
    return repository.get${obj.name}();
  }
}

''';

String modelGenerator(FeatureGenerated obj) => ''' 

import '../../domain/entities/${obj.packageName}.dart';

class ${obj.name}Model  extends ${obj.name}{
  

  ${obj.name}Model() : super();

  //implements fromJson and toJson
}

''';

String datasourceGenerator(FeatureGenerated obj) => ''' 

import '../../data/models/${obj.packageName}_model.dart';

abstract class I${obj.name}Datasource {
  Future<${obj.name}Model> get${obj.name}();
}

class ${obj.name}Datasource implements I${obj.name}Datasource {
  static const _ENDPOINT = '';
  //final ApiV1 api;

  ${obj.name}Datasource();

  @override
  Future<${obj.name}Model> get${obj.name}() async {
    //await api.get("\$_ENDPOINT/");
    return ${obj.name}Model();
  }
}

''';

String repositoryImplGenerator(FeatureGenerated obj) => ''' 

import 'package:dartz/dartz.dart';
import '../../data/models/${obj.packageName}_model.dart';
import '../../data/datasource/${obj.packageName}_datasource.dart';
import '../../domain/repositories/i${obj.packageName}_repository.dart';
import '../../domain/errors/${obj.packageName}_errors.dart';


class ${obj.name}RepositoryImpl implements I${obj.name}Repository{
  final I${obj.name}Datasource datasource;

  ${obj.name}RepositoryImpl(this.datasource);

  @override
  Future<Either<I${obj.name}Error, ${obj.name}Model>> get${obj.name}() async{
    try {
      final model = await datasource.get${obj.name}();
      return Right(model);
    } on Exception catch (_) {
      return Left(Unexpected${obj.name}Error());
    }
  }
}

''';

String pageGenerator(FeatureGenerated obj) => ''' 
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '${obj.packageName}_controller.dart';
class ${obj.name}Page extends StatefulWidget {
  const ${obj.name}Page({Key? key}) : super(key: key);
  @override
  _${obj.name}PageState createState() => _${obj.name}PageState();
}
class _${obj.name}PageState extends ModularState<${obj.name}Page, ${obj.name}Controller> {
  @override
  Widget build(BuildContext context) => const Scaffold();
}
''';

String controllerGenerator(FeatureGenerated obj) => ''' 
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part '${obj.packageName}_controller.g.dart';
class ${obj.name}Controller = _${obj.name}ControllerBase with _\$${obj.name}Controller;
abstract class _${obj.name}ControllerBase with Store {}
''';

String moduleGenerator(FeatureGenerated obj) => ''' 
import 'package:flutter_modular/flutter_modular.dart';
class ${obj.name}Module extends Module {
  @override
  final List<Bind> binds = [];
  @override
  final List<ModularRoute> routes = [];
}
''';
