import 'package:logger/logger.dart' show Level, Logger, PrettyPrinter;

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 8,
    lineLength: 120,
    colors: true,
    printEmojis: true,
    printTime: false,
  ),
  level: Level.warning,
);