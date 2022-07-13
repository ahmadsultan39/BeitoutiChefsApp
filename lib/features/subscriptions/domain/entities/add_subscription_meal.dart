import 'package:equatable/equatable.dart';

class AddSubscriptionMeal extends Equatable {
  final int id;
  final String name;

  const AddSubscriptionMeal(this.id, this.name);

  @override
  List<Object?> get props =>[id,name];

}