import 'dart:io';

String mainDirectory = '';

String formatName(String name) {
  name = name
      .replaceAll('_', ' ')
      .split(' ')
      .map((t) => t[0].toUpperCase() + t.substring(1))
      .join()
      .replaceFirst('.dart', '');
  return name;
}

String libPath(String path) {
  if (Directory('${mainDirectory}lib/app').existsSync()) {
    return '${mainDirectory}lib/app/$path';
  } else if (Directory('lib/src').existsSync()) {
    return '${mainDirectory}lib/src/$path';
  } else {
    return '${mainDirectory}lib/app/$path';
  }
}
