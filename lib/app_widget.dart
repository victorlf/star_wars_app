import 'package:escribo_star_wars/controller/cubit/api_cubit.dart';
import 'package:escribo_star_wars/controller/cubit/home_menu_cubit.dart';
import 'package:escribo_star_wars/core/http_client/http_client_imp.dart';
import 'package:escribo_star_wars/injections.dart' as injection;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'core/themes/app_theme.dart';
import 'presenter/screens/home_screen.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  late final GetIt i;

  @override
  void initState() {
    i = injection.initInjections();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeMenuCubit()),
        BlocProvider(create: (context) => ApiCubit(i())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: AppTheme.darkTheme,
        home: const HomeScreen(),
      ),
    );
  }
}
