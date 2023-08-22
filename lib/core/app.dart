import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

import '../config/router/app_route.dart';
import '../config/themes/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   theme: AppTheme.getApplicationTheme(),
    //   initialRoute: AppRoute.splashRoute,
    //   routes: AppRoute.getApplicationRoute(),
    // );

    return KhaltiScope(
      publicKey: dotenv.get('PUBLIC_KEY'),
      builder: (context, navigatorKey) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('ne', 'NP'),
          ],
          localizationsDelegates: const [
            KhaltiLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getApplicationTheme(),
          initialRoute: AppRoute.splashRoute,
          routes: AppRoute.getApplicationRoute(),
        );
      },
    );
  }
}
