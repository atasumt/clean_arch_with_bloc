import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/app/tehemes/light_theme.dart';
import 'package:flutter_project/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_project/features/homepage/presentation/bloc/homepage_bloc.dart';
import 'package:flutter_project/routes/app_routers.gr.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final appRouter = FlutterRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthenticationBloc(),
        ),
        BlocProvider(
          create: (_) => HomepageBloc(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter app',
        theme: lightTheme(context),
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
      ),
    );
  }
}
