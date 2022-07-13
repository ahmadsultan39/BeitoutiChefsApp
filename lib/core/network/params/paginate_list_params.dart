import 'package:equatable/equatable.dart';

class PaginateListParams extends Equatable {
  final int page;

  const PaginateListParams(this.page);

  @override
  List<Object?> get props => [page];
}