import 'package:alfred_cli/src/modules/generate.dart';
import 'package:args/command_runner.dart';

import '../command_base.dart';

class GenerateTemplateSubCommand extends CommandBase {
  @override
  final name = 'template';
  @override
  final description = 'Creates a template';

  GenerateTemplateSubCommand() {
    argParser.addFlag('widgetBehaviour', abbr: 'b', negatable: false);
  }

  @override
  void run() {
    if (argResults!.rest.isEmpty) {
      throw UsageException('value not passed for a module command', usage);
    } else {
      Generate.component(
          path: argResults!.rest.first,
          type: 'template',
          haveWidgetBehaviour:
              argResults?.wasParsed('widgetBehaviour') ?? false);
    }
  }
}

class GenerateTemplateAbbrSubCommand extends GenerateTemplateSubCommand {
  @override
  final name = 't';
}
