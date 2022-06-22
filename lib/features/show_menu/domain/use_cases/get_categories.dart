import 'package:beitouti_chefs/core/entities/category.dart';
import 'package:beitouti_chefs/features/show_menu/domain/repositories/show_menu.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

@lazySingleton
class GetCategoriesUseCase
    implements UseCase<List<Category>, NoParams> {
  final ShowMenuRepository _repository;

  GetCategoriesUseCase(this._repository);

  @override
  Future<Either<Failure,List<Category> >> call(
      NoParams params) async {
    return await _repository.getCategories();
  }
}