import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

import 'core/config/constants/app_constants.dart';
import 'core/config/theme/color/dark_theme.dart';
import 'core/config/theme/color/light_theme.dart';
import 'core/logic/order/order_bloc.dart';
import 'core/logic/theme/cubit/theme_cubit.dart';
import 'core/logic/theme/cubit/theme_state.dart';
import 'core/routing/app_router.dart';
import 'core/services/order_repo/order_repo.dart';
import 'mod/kohi_main_screen/page/kohi_main_screen.dart';

class KohiManagerApp extends StatelessWidget {
  const KohiManagerApp({required this.appRouter, super.key});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    child: ToastificationWrapper(
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themestate) => MaterialApp(
          title: AppConstants.appName,
          theme: LightTheme,
          darkTheme: DarkTheme,
          themeMode: themestate.themeMode,
          navigatorKey: AppRouter.navigatorKey,
          onGenerateRoute: appRouter.generateRoute,
          debugShowCheckedModeBanner: false,
          home: const KohiMainScreen(),
          builder: (context, child) => BlocProvider(
            create: (context) => OrderBloc(OrderService()),
            child: SafeArea(
              top: false,
              left: false,
              right: false,
              child: child!,
            ),
          ),
        ),
      ),
    ),
  );
}
