import 'package:beitouti_chefs/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

@lazySingleton
class ChangeProfilePictureUseCase
    implements UseCase<void, ParamsChangeProfilePictureUseCase> {
  final ProfileRepository _repository;

  ChangeProfilePictureUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(ParamsChangeProfilePictureUseCase params) {
    return _repository.checkCode(
      code: params.code,
      phoneNumber: params.phoneNumber,
    );
  }
}

class ParamsChangeProfilePictureUseCase extends Equatable {
  final FilePickerResult image;

  const ParamsChangeProfilePictureUseCase({
    required this.code,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props {
    image.
    return [];
  };
}
