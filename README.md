![Version](https://img.shields.io/badge/alfred-v1.0-blue)

```
░█████╗░██╗░░░░░███████╗██████╗░███████╗██████╗░  
██╔══██╗██║░░░░░██╔════╝██╔══██╗██╔════╝██╔══██╗  
███████║██║░░░░░█████╗░░██████╔╝█████╗░░██║░░██║  
██╔══██║██║░░░░░██╔══╝░░██╔══██╗██╔══╝░░██║░░██║  
██║░░██║███████╗██║░░░░░██║░░██║███████╗██████╔╝  
╚═╝░░╚═╝╚══════╝╚═╝░░░░░╚═╝░░╚═╝╚══════╝╚═════╝░ 
```

## Alfred

Alfred: A simple cli to generate widgets and features with Clean Arch and Mobx.

## Commands

- To install the most recent version of a _plugin_

```
alfred i plugin_name
```

- To run _flutter pub run build_runner build --delete-conflicting-outputs_

```
alfred run build
```

- To generate an _atom_

```
alfred g a name
```

- To generate an _atom_ with WidgetBehaviour

```
alfred g a name -b
```

- To generate a _molecule_

```
alfred g m name
```

- To generate a _molecule_ with WidgetBehaviour

```
alfred g m name -b
```

- To generate an _organism_

```
alfred g o name
```

- To generate an _organism_ with WidgetBehaviour

```
alfred g o name -b
```

- To generate a _template_

```
alfred g t name
```

- To generate an _template_ with WidgetBehaviour

```
alfred g t name -b
```

- To generate a _feature_ structure

```
alfred g f name
```

# Installing

- Append alfred_cli /bin folder path to your ~/.bashrc (gets reiniated each time you open a bash shell) or ~/.profile (only read at login) file.

- with dart sdk installed run this command inside project folder:

```
dart2native bin/alfred_cli.dart -o bin/alfred
```

- If in doubt, contact me. gabrielgoliveira04@gmail.com.

## Roadmap

| Feature                               | Progress |
| :------------------------------------ | :------: |
| Generate widgets                      |    ✅    |
| Generate widgets with WidgetBehaviour |    ✅    |
| Generate feature                      |    ✅    |
| Create test for the generated widgets |    ✅    |
| Generate doc on flutter web           |          |
| Creates presentation layer            |    ✅    |

```

```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
