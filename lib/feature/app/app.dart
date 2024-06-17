import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app_sql/core/theme/style.dart';
import 'package:test_app_sql/feature/app/bloc_providers.dart';

class App extends StatefulWidget {
  const App({
    super.key,
    required this.goRouter,
  });

  final GoRouter goRouter;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late GetIt locator;

  @override
  void initState() {
    locator = GetIt.instance;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MultiBlocProvider(
      providers: buildListProviders(locator: locator),

      child: MaterialApp.router(
        routerConfig: widget.goRouter,
        theme: Themes.lightTheme,
      ),
    );
  }
}
