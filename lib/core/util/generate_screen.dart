import 'package:beitouti_chefs/features/profile/domain/entities/profile.dart';
import 'package:beitouti_chefs/features/profile/presentation/pages/chef_balance_page.dart';
import 'package:beitouti_chefs/features/profile/presentation/pages/edit_order_settings_page.dart';
import 'package:beitouti_chefs/features/profile/presentation/pages/meals_notes_page.dart';
import 'package:beitouti_chefs/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/auth_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/profile/presentation/pages/order_history_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
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
      case NameScreen.splashScreen:
        {
          return MaterialPageRoute(
            builder: (_) => const SplashPage(),
          );
        }
      case NameScreen.authScreen:
        {
          return MaterialPageRoute(
            builder: (_) => const AuthPage(),
          );
        }
      case NameScreen.homeScreen:
        {
          return MaterialPageRoute(
            builder: (_) => const HomePage(),
          );
        }
      case NameScreen.profileScreen:
        {
          return MaterialPageRoute(
            builder: (_) => const ProfilePage(),
          );
        }
      case NameScreen.showMenu:
        {
          return MaterialPageRoute(
            builder: (context) => const ShowMenuPage(),
          );
        }
      case NameScreen.addMeal:
        {
          return MaterialPageRoute(
            builder: (context) => AddMealPage(
              initMeal: value.arguments as Meal?,
            ),
          );
        }
      case NameScreen.orderMealsNotesScreen:
        {
          return MaterialPageRoute(
            builder: (context) => const MealsNotesPage(),
          );
        }   case NameScreen.ordersHistoryScreen:
        {
          return MaterialPageRoute(
            builder: (context) => const OrderHistoryPage(),
          );
        }
      case NameScreen.editOrderSettingsScreen:
        {
          return MaterialPageRoute(
            builder: (context) =>  EditOrderSettingsPage(profile: value.arguments as Profile),
          );
        }
      case NameScreen.chefBalanceScreen:
        {
          return MaterialPageRoute(
            builder: (context) => const ChefBalancePage(),
          );
        }
      case NameScreen.addSubscription:
        {
          return MaterialPageRoute(
            builder: (context) =>  AddNewSubscriptionPage(
              initSubscription: value.arguments as NewSubscription?,
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
  static const String splashScreen = "/";
  static const String authScreen = "/auth";
  static const String homeScreen = "/home";
  static const String profileScreen = "/profile";
  static const String showMenu = "/show-menu";
  static const String addMeal = "/add-meal";
  static const String addSubscription = "/add-subscription";
  static const String ordersHistoryScreen = "/orders-history";
  static const String orderMealsNotesScreen = "/order-meals-notes";
  static const String editOrderSettingsScreen = "/edit-order-settings";
  static const String chefBalanceScreen = "/chef-balance";
}
