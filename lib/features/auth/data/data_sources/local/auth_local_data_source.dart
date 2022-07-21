import '../../../../../core/data/base_local_data_source.dart';
import '../../models/user_model.dart';

abstract class AuthLocalDataSource extends BaseLocalDataSource {
  Future<void> saveUser(UserModel user);
}
