import 'package:beitouti_chefs/core/data/base_local_data_source.dart';

abstract class HomeLocalDataSource extends BaseLocalDataSource {
  Future<void> setAvailabilityStatus(bool value);

  Future<bool> getAvailabilityStatus();
}
