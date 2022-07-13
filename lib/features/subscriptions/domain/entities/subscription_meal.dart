import 'package:equatable/equatable.dart';

class SubscriptionMeal extends Equatable {
  final int id;
  final String image;
  final String name;
  final int price;
  final int dayNumber;

  const SubscriptionMeal(
      this.id, this.image, this.name, this.price, this.dayNumber);

  @override
  List<Object?> get props => [id, image, name, price, dayNumber];
}
