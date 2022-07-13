class Meal {
  final int id;
  final String imageUrl;
  final String name;
  final int categoryId;
  final String ingredients;
  final int preparingTime;
  int maxMeals;
  final int price;
  final double? discount;
  bool? isAvailable;
  final double? rating;
  final int? ratingCount;
  final bool? isApproved;

  Meal({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.categoryId,
    required this.ingredients,
    required this.preparingTime,
    required this.maxMeals,
    required this.price,
    required this.discount,
    this.isAvailable,
    required this.rating,
    required this.ratingCount,
    required this.isApproved,
  });

  void increaseMaxMealCount(){
    maxMeals++;
  }

  void decreaseMaxMealCount(){
    maxMeals--;
  }

  void changeStatus(){
    isAvailable = !isAvailable!;
  }
}
