import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              colorScheme: ColorScheme.fromSwatch().copyWith(
                secondary: const Color(0xFF2B9694),
                background: const Color(0xFFE1E8EA),
                tertiary: const Color(0xFFEC9005),
              )),
          home: Container(),
        );
      },
    );
  }
}
