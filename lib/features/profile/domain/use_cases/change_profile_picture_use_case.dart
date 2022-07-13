import 'package:beitouti_chefs/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
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
    return _repository.changeProfilePicture(image: params.image);
  }
}

class ParamsChangeProfilePictureUseCase extends Equatable {
  final XFile image;

  const ParamsChangeProfilePictureUseCase({
    required this.image,
  });

  @override
  List<Object?> get props => [image];
}
