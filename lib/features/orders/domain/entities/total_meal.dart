import 'package:equatable/equatable.dart';

class TotalMeal extends Equatable {
  final int id;
  final int chefId;
  final String name;
  final String image;
  final int quantity;

  const TotalMeal(this.id, this.chefId, this.name, this.image, this.quantity);

  @override
  List<Object?> get props => [
        id,
        chefId,
        name,
        image,
        quantity,
      ];
}
