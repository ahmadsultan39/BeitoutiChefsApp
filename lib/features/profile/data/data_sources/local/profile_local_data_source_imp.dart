import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/data/base_local_data_source.dart';

import 'profile_local_data_source.dart';

@LazySingleton(as: ProfileLocalDataSource)
class ProfileLocalDataSourceImp extends BaseLocalDataSourceImpl
    implements ProfileLocalDataSource {
  final ImagePicker _picker;

  ProfileLocalDataSourceImp(
    this._picker, {
    required SharedPreferences sharedPreferences,
  }) : super(sharedPreferences: sharedPreferences);

  @override
  Future<XFile?> pickImage() async {
    return await _picker.pickImage(source: ImageSource.gallery);
  }
}
