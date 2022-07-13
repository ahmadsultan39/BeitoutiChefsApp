import 'package:beitouti_chefs/core/data/base_local_data_source.dart';
import 'package:image_picker/image_picker.dart';

abstract class AddMealLocalDataSource extends BaseLocalDataSource {
  Future<XFile?> pickImage();
}