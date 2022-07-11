import 'package:beitouti_chefs/core/entities/meal.dart';
import 'package:beitouti_chefs/features/add_meal/presentation/pages/add_meal.dart';
import 'package:beitouti_chefs/features/show_menu/presentation/pages/show_menu.dart';
import 'package:beitouti_chefs/features/subscriptions/domain/entities/subscription.dart';
import 'package:beitouti_chefs/features/subscriptions/presentation/pages/add_subscription_page.dart';
import 'package:flutter/material.dart';

import '../../features/subscriptions/domain/entities/new_subscription.dart';

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
      case NameScreen.addSubscription:
        {
          return MaterialPageRoute(
            builder: (context) => AddNewSubscriptionPage(
            initSubscription:  value.arguments as NewSubscription?,
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
  static const String addSubscription = "/add-subscription";
}
