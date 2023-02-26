import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_project/app/logger/logger.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    logger().d('Error', details.exceptionAsString());
  };

  await runZonedGuarded(
    () async {
      runApp(await builder());
    },
    (error, stackTrace) => logger().d('Error', error.toString()),
  );
}
