import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/error/screen_error.dart';
import 'core/logic/theme/cubit/theme_cubit.dart';
import 'core/logic/theme/cubit/theme_shared_preferences.dart';

import 'core/routing/app_router.dart';
import 'core/shared_preferences_global/shared_preferences_global.dart';

import 'kohi_manager_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferencesGlobal().initialize();
  errorScreen();

  final themeCubit = ThemeCubit(
    themeSharedPreferences: ThemeSharedPreferences(),
  );

  runApp(
    BlocProvider.value(
      value: themeCubit,
      child: KohiManagerApp(appRouter: AppRouter()),
    ),
  );
}
