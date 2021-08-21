import 'package:alfred_cli/src/commands/sub_commands/build_runner_build_command.dart';

import 'command_base.dart';

class RunCommand extends CommandBase {
  @override
  final name = 'run';
  @override
  final description = 'Run a command';
  final abbr = 'r';

  RunCommand() {
    addSubcommand(BuildRunnerBuildCommand());
    addSubcommand(BuildRunnerBuildSubCommand());
  }
}

class RunCommandAbbr extends RunCommand {
  @override
  final name = 'r';
}
