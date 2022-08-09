import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/util/enums.dart';
import '../../domain/entities/accessibility_status.dart';
import '../../domain/entities/request_register.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/local/auth_local_data_source.dart';
import '../data_sources/remote/auth_remote_data_source.dart';
import '../models/request_register_model.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImp implements AuthRepository {
  final AuthLocalDataSource _local;
  final AuthRemoteDataSource _http;

  AuthRepositoryImp(this._local, this._http);

  @override
  Future<Either<Failure, void>> sendCode({
    required String phoneNumber,
  }) async {
    try {
      await _http.sendCode(phoneNumber: phoneNumber);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }

  @override
  Future<Either<Failure, AccessibilityStatus>> checkCode({
    required String phoneNumber,
    required String code,
  }) async {
    try {
      String? fcmToken;// = await FirebaseMessaging.instance.getToken();
      fcmToken = fcmToken ?? "";
      final accessibilityStatus = await _http.checkCodeAndAccessibility(
        phoneNumber: phoneNumber,
        code: code,
        fcmToken: fcmToken,
      );
      if (accessibilityStatus.status == AccessibilityStaysType.active) {
        _local.saveUser(accessibilityStatus.userModel!);
      }
      return Right(accessibilityStatus);
    } on ServerException catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }

  @override
  Future<Either<Failure, void>> requestRegister({
    required RegisterRequest request,
  }) async {
    try {
      String? fcmToken = await FirebaseMessaging.instance.getToken();
      fcmToken = fcmToken ?? "";
      await _http.requestRegister(
        request: RegisterRequestModel(
          name: request.name,
          email: request.email,
          location: request.location,
          gender: request.gender.index,
          phoneNumber: request.phoneNumber,
          birthDate: request.birthDate,
          deliveryStartsAt: request.deliveryStartsAt,
          longitude: request.longitude,
          latitude: request.latitude,
          deliveryEndsAt: request.deliveryEndsAt,
          maxMealsPerDay: request.maxMealsPerDay,
        ),
        fcmToken: fcmToken,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }
}
