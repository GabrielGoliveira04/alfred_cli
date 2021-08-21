import 'package:alfred_cli/src/modules/build_runner.dart';
import 'package:alfred_cli/src/modules/generate.dart';
import 'package:args/command_runner.dart';

import '../command_base.dart';

class GenerateFeatureSubCommand extends CommandBase {
  @override
  final name = 'feature';
  @override
  final description = 'Creates a Feature structure';

  GenerateFeatureSubCommand();

  @override
  void run() {
    if (argResults!.rest.isEmpty) {
      throw UsageException('value not passed for a module command', usage);
    } else {
      Generate.feature(
        path: argResults!.rest.first,
      );
      buildRunnerMobx();
    }
  }
}

class GenerateFeatureAbbrSubCommand extends GenerateFeatureSubCommand {
  @override
  final name = 'f';
}
