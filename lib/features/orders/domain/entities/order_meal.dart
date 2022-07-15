import 'package:equatable/equatable.dart';

class OrderMeal extends Equatable {
  final int id;
  final int chefId;
  final String name;
  final String image;
  final int price;
  final double discountPercentage;
  final int quantity;

  const OrderMeal(this.id, this.chefId, this.name, this.image, this.price,
      this.discountPercentage, this.quantity);

  @override
  List<Object?> get props =>
      [id, chefId, name, image, price, discountPercentage, quantity];
}
