import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'pagination_state_data.g.dart';

abstract class PaginationStateData<T>
    implements Built<PaginationStateData<T>, PaginationStateDataBuilder<T>> {
  BuiltList<T> get items;

  bool get isLoading;

  bool get isFinished;

  int get currentPage;

  int get total;

  PaginationStateData._();

  factory PaginationStateData(
      [Function(PaginationStateDataBuilder<T> b) updates]) = _$PaginationStateData<T>;

  factory PaginationStateData.initial() => PaginationStateData<T>(
        (b) => b
      ..items.replace([])
      ..isLoading = false
      ..isFinished = false
      ..currentPage = 1
      ..total = 0,
  );
}

