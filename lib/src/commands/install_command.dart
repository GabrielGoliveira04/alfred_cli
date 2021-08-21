import 'package:alfred_cli/src/modules/install.dart';
import 'package:args/command_runner.dart';

import 'command_base.dart';

class InstallCommand extends CommandBase {
  @override
  final name = 'install';
  @override
  final description = 'Install packages on pubspec';
  final abbr = 'i';

  InstallCommand();

  @override
  void run() {
    if (argResults!.rest.isEmpty) {
      throw UsageException('value not passed for a module command', usage);
    } else {
      install(argResults!.rest.first);
    }
  }
}

class InstallCommandAbbr extends InstallCommand {
  @override
  final name = 'i';
}
