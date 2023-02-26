import 'package:logger/logger.dart';

Logger logger({LogFilter? logFilter, LogPrinter? printer, LogOutput? output}) {
  var logger = Logger(
    filter: logFilter,
    printer: printer ?? PrettyPrinter(),
    output: output,
  );
  return logger;
}
