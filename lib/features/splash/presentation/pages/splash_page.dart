import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/constants.dart';
import '../../../../core/util/generate_screen.dart';
import '../../../../injection.dart';
import '../bloc/splash.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _bloc = sl<SplashBloc>();

  @override
  void initState() {
    _bloc.addCheckAuthEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state.isAuth != null) {
          if (state.isAuth!) {
            WidgetsBinding.instance?.addPostFrameCallback(
              (_) {
                Navigator.pushReplacementNamed(context, NameScreen.homeScreen);
              },
            );
          } else {
            WidgetsBinding.instance?.addPostFrameCallback(
              (_) {
                Navigator.pushReplacementNamed(context, NameScreen.authScreen);
              },
            );
          }
        }
      },
      child: BlocBuilder<SplashBloc, SplashState>(
        bloc: _bloc,
        builder: (context, state) {
          WidgetsBinding.instance?.addPostFrameCallback(
            (_) {
              message(
                message: state.message,
                isError: state.error,
                context: context,
                bloc: _bloc,
              );
            },
          );
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.primary,
            body: Center(
              child: Image.asset(
                "assets/images/logo.png",
                width: 300.w,
                fit: BoxFit.fitWidth,
              ),
            ),
          );
        },
      ),
    );
  }
}
