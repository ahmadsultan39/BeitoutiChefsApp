import 'package:beitouti_chefs/core/entities/meal.dart';
import 'package:beitouti_chefs/features/add_meal/presentation/pages/add_meal.dart';
import 'package:beitouti_chefs/features/show_menu/presentation/pages/show_menu.dart';
import 'package:flutter/material.dart';

class GenerateScreen {
  static Route<dynamic> onGenerate(RouteSettings value) {
    String name = value.name ?? '';
    debugPrint("the name is $name");
    switch (name) {
      case NameScreen.SHOW_MENU:
        {
          return MaterialPageRoute(
            builder: (context) => const ShowMenuPage(),
          );
        }
      case NameScreen.ADD_MEAL:
        {
          return MaterialPageRoute(
            builder: (context) => AddMealPage(
            initMeal:  value.arguments as Meal?,
            ),
          );
        }
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('ERROR'),
          ),
        );
      },
    );
  }
}

class NameScreen {
  static const String SHOW_MENU = "/show-menu";
  static const String ADD_MEAL = "/add-meal";
}
