import 'package:beitouti_chefs/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/util/app_localizations.dart';
import '../core/util/generate_screen.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    // For portrait use only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_) {
        return MaterialApp(
          title: 'Beitouti Chefs',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: GenerateScreen.onGenerate,
          theme: ThemeData(
            fontFamily: "Thesans",
            primaryColor: const Color(0xFF013760),
            backgroundColor: const Color(0xFFE1E8EA),
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: const Color(0xFF013760),
              secondary: const Color(0xFF2B9694),
              background: const Color(0xFFE1E8EA),
              tertiary: const Color(0xFFEC9005),
            ),
          ),
          home: const SplashPage(),
          locale: const Locale('ar', ''),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ar', ''),
          ],
        );
      },
    );
  }
}
