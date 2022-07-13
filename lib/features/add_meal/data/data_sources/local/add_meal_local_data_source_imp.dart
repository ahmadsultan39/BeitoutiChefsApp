import 'package:beitouti_chefs/core/data/base_local_data_source.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'add_meal_local_data_source.dart';

@LazySingleton(as: AddMealLocalDataSource)
class AddMealLocalDataSourceImp extends BaseLocalDataSourceImpl
    implements AddMealLocalDataSource {
  AddMealLocalDataSourceImp(this._picker,
      {required SharedPreferences sharedPreferences})
      : super(sharedPreferences: sharedPreferences);

  final ImagePicker _picker;

  @override
  Future<XFile?> pickImage() async {
    return await _picker.pickImage(source: ImageSource.gallery);
  }
}
