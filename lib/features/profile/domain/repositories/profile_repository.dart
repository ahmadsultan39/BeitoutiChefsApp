import 'package:beitouti_chefs/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/data/base_repository.dart';
import '../../data/models/chef_balance_model.dart';
import '../../data/models/order_meal_note_model.dart';
import '../../data/models/prepared_order_model.dart';
import '../../data/models/profile_model.dart';

abstract class ProfileRepository extends BaseRepository {
  Future<Either<Failure, List<OrderMealNoteModel>>> getOrderMealsNotes();

  Future<Either<Failure, List<PreparedOrderModel>>> getOrdersHistory();

  Future<Either<Failure, ChefBalanceModel>> getChefBalance();

  Future<Either<Failure, ProfileModel>> getChefProfile();

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, void>> changeProfilePicture({
    required XFile image,
  });

  Future<Either<Failure, void>> editMaxMealsPerDay({
    required int maxMealsPerDay,
  });

  Future<Either<Failure, void>> editDeliverMealTime({
    required String startsAt,
    required String endsAt,
  });
}
