import '../utils/widgets_utils.dart' as widgets_utils;
import '../utils/feature_utils.dart' as feature_utils;
import '../templates/templates.dart' as templates;

class Generate {
  static void component(
      {required String path,
      required String type,
      required bool haveWidgetBehaviour}) async {
    await widgets_utils.createFile(
      path: path,
      type: type,
      haveWidgetBehaviour: haveWidgetBehaviour,
      generateWidget: templates.componentGenerator,
      generateTest: templates.testGenerator,
    );
  }

  static void feature({required String path}) async {
    await feature_utils.createFile(
        path: path,
        generateEntity: templates.entityGenerator,
        generateRepository: templates.repositoryGenerator,
        generateError: templates.errorGenerator,
        generateUseCase: templates.usecaseGenerator,
        generateModel: templates.modelGenerator,
        generateDatasource: templates.datasourceGenerator,
        generateRepositoryImpl: templates.repositoryImplGenerator,
        generatePage: templates.pageGenerator,
        generateController: templates.controllerGenerator,
        generateModule: templates.moduleGenerator);
  }
}
