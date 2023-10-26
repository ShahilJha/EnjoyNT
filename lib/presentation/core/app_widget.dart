import 'package:config/config.dart';
import 'package:enjoy_nt/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../application/auth/auth_bloc.dart';
import '../routes/router.dart';
import 'theme/light_theme.dart';

final GlobalKey<ScaffoldMessengerState> kScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> kNavigatorKey = GlobalKey<NavigatorState>();

class AppWidget extends StatelessWidget {
  AppWidget({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) => getIt<AuthBloc>()
            ..add(
              const AuthEvent.authCheckRequested(),
            )),
        ),
      ],
      child: MaterialApp.router(
        scaffoldMessengerKey: kScaffoldMessengerKey,
        routerConfig: _appRouter.config(),
        title: kAppHeading,
        debugShowCheckedModeBanner: false,
        theme: kLightTheme,
        // darkTheme: kDarkTheme,
        // themeMode: ,
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: const [
            Breakpoint(start: 0, end: 350, name: MOBILE),
            Breakpoint(start: 351, end: 800, name: TABLET),
            Breakpoint(start: 801, end: 1700, name: DESKTOP),
            Breakpoint(start: 1701, end: double.infinity, name: 'XL'),
          ],
        ),
      ),
    );
  }
}
