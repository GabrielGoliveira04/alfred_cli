import 'package:alfred_cli/src/modules/generate.dart';
import 'package:args/command_runner.dart';

import '../command_base.dart';

class GenerateAtomSubCommand extends CommandBase {
  @override
  final name = 'atom';
  @override
  final description = 'Creates a atom';

  GenerateAtomSubCommand() {
    argParser.addFlag('widgetBehaviour', abbr: 'b', negatable: false);
  }

  @override
  void run() {
    if (argResults!.rest.isEmpty) {
      throw UsageException('value not passed for a module command', usage);
    } else {
      Generate.component(
        path: argResults!.rest.first,
        type: 'atoms',
        haveWidgetBehaviour: argResults?.wasParsed('widgetBehaviour') ?? false,
      );
    }
  }
}

class GenerateAtomAbbrSubCommand extends GenerateAtomSubCommand {
  @override
  final name = 'a';
}
