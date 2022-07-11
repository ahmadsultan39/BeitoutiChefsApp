import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../auth/presentation/pages/auth_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: AnimatedSplashScreen(
        duration: 300,
        backgroundColor: Theme.of(context).colorScheme.background,
        splashIconSize: 200.sp,
        splashTransition: SplashTransition.decoratedBoxTransition,
        splash: Image.asset(
          "assets/images/logo.png",
        ),
        nextScreen: const AuthPage(),
      ),
    );
  }
}
