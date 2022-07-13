import 'package:beitouti_chefs/features/profile/data/models/chef_balance_model.dart';
import 'package:beitouti_chefs/features/profile/data/models/order_meal_note_model.dart';
import 'package:beitouti_chefs/features/profile/data/models/prepared_order_model.dart';
import 'package:beitouti_chefs/features/profile/data/models/profile_model.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/data/base_remote_datasource.dart';

abstract class ProfileRemoteDataSource extends BaseRemoteDataSource {
  Future<void> changeProfilePicture({
    required String token,
    required XFile image,
  });

  Future<void> editMaxMealsPerDay({
    required String token,
    required int maxMealsPerDay,
  });

  Future<void> editDeliverMealTime({
    required String token,
    required String startsAt,
    required String endsAt,
  });

  Future<void> logout({
    required String token,
  });

  Future<List<OrderMealNoteModel>> getOrderMealsNotes({
    required String token,
  });

  Future<List<PreparedOrderModel>> getOrdersHistory({
    required String token,
  });

  Future<ChefBalanceModel> getChefBalance({
    required String token,
    String? startDate,
    String? endDate,
  });

  Future<ProfileModel> getChefProfile({
    required String token,
  });
}
