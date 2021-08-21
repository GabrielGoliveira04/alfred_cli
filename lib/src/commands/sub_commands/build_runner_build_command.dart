import 'package:alfred_cli/src/modules/build_runner.dart';

import '../command_base.dart';

class BuildRunnerBuildCommand extends CommandBase {
  @override
  final name = 'build';
  @override
  final description =
      'Run flutter pub run build_runner build --delete-conflicting-outputs';

  BuildRunnerBuildCommand();

  @override
  void run() {
    buildRunnerMobx();
  }
}

class BuildRunnerBuildSubCommand extends BuildRunnerBuildCommand {
  @override
  final name = 'b';
}
