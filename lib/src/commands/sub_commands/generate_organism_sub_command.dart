import 'package:alfred_cli/src/modules/generate.dart';
import 'package:args/command_runner.dart';

import '../command_base.dart';

class GenerateOrganismSubCommand extends CommandBase {
  @override
  final name = 'organism';
  @override
  final description = 'Creates a organism';

  GenerateOrganismSubCommand() {
    argParser.addFlag('widgetBehaviour', abbr: 'b', negatable: false);
  }

  @override
  void run() {
    if (argResults!.rest.isEmpty) {
      throw UsageException('value not passed for a module command', usage);
    } else {
      Generate.component(
          path: argResults!.rest.first,
          type: 'organisms',
          haveWidgetBehaviour:
              argResults?.wasParsed('widgetBehaviour') ?? false);
    }
  }
}

class GenerateOrganismAbbrSubCommand extends GenerateOrganismSubCommand {
  @override
  final name = 'o';
}
