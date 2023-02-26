import 'package:flutter/material.dart';
import 'package:flutter_project/app/flavours/app_flavour.dart';
import 'package:flutter_project/app/view/app.dart';
import 'package:flutter_project/core/service_locator.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpServiceLocator();
  await bootstrap(() => App());
}
