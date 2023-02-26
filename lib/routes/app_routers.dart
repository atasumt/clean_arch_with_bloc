import 'package:auto_route/auto_route.dart';
import 'package:flutter_project/app/const/route/route_name.dart';
import 'package:flutter_project/features/auth/presentation/screens/authentication_screen.dart';
import 'package:flutter_project/features/homepage/presentation/screens/homepage_screen.dart';
import 'package:flutter_project/features/splash/presentation/splash_screen.dart';

@MaterialAutoRouter(
  routes: [
    AutoRoute<bool>(page: SplashScreen, initial: true),
    AutoRoute<bool>(page: AuthenticationScreen, path: RouteName.autRouteName),
    AutoRoute<bool>(page: HomepageScreen, path: RouteName.homeRouteName),
  ],
  replaceInRouteName: 'Page,Route',
)
class $FlutterRouter {}
