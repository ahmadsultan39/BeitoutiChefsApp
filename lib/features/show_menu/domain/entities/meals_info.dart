import 'package:equatable/equatable.dart';

class MealsInfo extends Equatable {
  final int activeMeals;
  final int totalMeals;

  MealsInfo(this.activeMeals, this.totalMeals);

  @override
  List<Object?> get props =>[activeMeals,totalMeals];
}