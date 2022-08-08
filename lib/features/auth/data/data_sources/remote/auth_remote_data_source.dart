import '../../../../../core/data/base_remote_datasource.dart';
import '../../models/accessibility_status_model.dart';
import '../../models/request_register_model.dart';

abstract class AuthRemoteDataSource extends BaseRemoteDataSource {
  Future<AccessibilityStatusModel> checkCodeAndAccessibility({
    required String phoneNumber,
    required String code,
    required String fcmToken,
  });

  Future<void> sendCode({
    required String phoneNumber,
  });

  Future<void> requestRegister({
    required RegisterRequestModel request,
    required String fcmToken,
  });
}
