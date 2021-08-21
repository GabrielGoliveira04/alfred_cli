import 'package:alfred_cli/src/commands/sub_commands/generate_feature_sub_command.dart';
import 'package:alfred_cli/src/commands/sub_commands/generate_molecule_sub_command.dart';
import 'package:alfred_cli/src/commands/sub_commands/generate_organism_sub_command.dart';
import 'package:alfred_cli/src/commands/sub_commands/generate_template_sub_command.dart';

import 'command_base.dart';
import 'sub_commands/generate_atom_sub_command.dart';

class GenerateCommand extends CommandBase {
  @override
  final name = 'generate';
  @override
  final description =
      'Creates an atom, molecule, organism or feature structure';
  final abbr = 'g';

  GenerateCommand() {
    addSubcommand(GenerateAtomSubCommand());
    addSubcommand(GenerateAtomAbbrSubCommand());
    addSubcommand(GenerateMoleculeSubCommand());
    addSubcommand(GenerateMoleculeAbbrSubCommand());
    addSubcommand(GenerateOrganismSubCommand());
    addSubcommand(GenerateOrganismAbbrSubCommand());
    addSubcommand(GenerateTemplateSubCommand());
    addSubcommand(GenerateTemplateAbbrSubCommand());
    addSubcommand(GenerateFeatureSubCommand());
    addSubcommand(GenerateFeatureAbbrSubCommand());
  }
}

class GenerateCommandAbbr extends GenerateCommand {
  @override
  final name = 'g';
}
