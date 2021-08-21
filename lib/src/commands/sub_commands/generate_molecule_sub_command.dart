import 'package:alfred_cli/src/modules/generate.dart';
import 'package:args/command_runner.dart';

import '../command_base.dart';

class GenerateMoleculeSubCommand extends CommandBase {
  @override
  final name = 'molecule';
  @override
  final description = 'Creates a molecule';

  GenerateMoleculeSubCommand() {
    argParser.addFlag('widgetBehaviour', abbr: 'b', negatable: false);
  }

  @override
  void run() {
    if (argResults!.rest.isEmpty) {
      throw UsageException('value not passed for a module command', usage);
    } else {
      Generate.component(
          path: argResults!.rest.first,
          type: 'molecules',
          haveWidgetBehaviour:
              argResults?.wasParsed('widgetBehaviour') ?? false);
    }
  }
}

class GenerateMoleculeAbbrSubCommand extends GenerateMoleculeSubCommand {
  @override
  final name = 'm';
}
