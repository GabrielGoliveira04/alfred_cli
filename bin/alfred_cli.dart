import 'package:alfred_cli/alfred_cli.dart';
import 'package:alfred_cli/src/commands/run_command.dart';
import 'package:alfred_cli/src/modules/version.dart';
import 'package:args/args.dart';
import 'package:args/command_runner.dart';

void main(List<String> arguments) async {
  final runner = configureCommand(arguments);

  var hasCommand = runner.commands.keys.any((x) => arguments.contains(x));

  if (hasCommand) {
    executeCommand(runner, arguments);
  } else {
    var parser = ArgParser();
    parser = runner.argParser;
    var results = parser.parse(arguments);
    executeOptions(results, arguments, runner);
  }
}

void executeOptions(
    ArgResults results, List<String> arguments, CommandRunner runner) {
  if (results.wasParsed('help') || arguments.isEmpty) {
    print(runner.usage);
  }

  if (results.wasParsed('version')) {
    version('1.0.0');
  }
}

void executeCommand(CommandRunner runner, List<String> arguments) {
  runner.run(arguments).catchError((error) {
    if (error is! UsageException) throw error;
    print(error);
  });
}

CommandRunner configureCommand(List<String> arguments) {
  var runner = CommandRunner('alfred', 'CLI by Gabriel Gomes')
    ..addCommand(GenerateCommand())
    ..addCommand(GenerateCommandAbbr())
    ..addCommand(InstallCommand())
    ..addCommand(InstallCommandAbbr())
    ..addCommand(RunCommand())
    ..addCommand(RunCommandAbbr());
  runner.argParser.addFlag('version', abbr: 'v', negatable: false);
  return runner;
}
