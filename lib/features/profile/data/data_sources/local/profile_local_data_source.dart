import 'package:image_picker/image_picker.dart';

import '../../../../../core/data/base_local_data_source.dart';

abstract class ProfileLocalDataSource extends BaseLocalDataSource {
  Future<XFile?> pickImage();
}
