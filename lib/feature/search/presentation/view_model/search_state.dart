import 'package:smart_check/feature/search/domain/entity/examination_entity.dart';

// Base State
abstract class SearchState {
  List<ExaminationEntity> get examinations => [];
  String get errorMessage => '';
}

// Initial
class SearchInitialState extends SearchState {}

// Loading States
class GetExByClIDLoading extends SearchState {}

class GetExByDateLoading extends SearchState {}

// Error States
class GetExByClIDError extends SearchState {
  @override
  final String errorMessage;
  GetExByClIDError({required this.errorMessage});
}

class GetExByDateError extends SearchState {
  @override
  final String errorMessage;
  GetExByDateError({required this.errorMessage});
}

// Success States
class GetExByClIDSuccess extends SearchState {
  @override
  final List<ExaminationEntity> examinations;
  GetExByClIDSuccess({required this.examinations});
}

class GetExByDateSuccess extends SearchState {
  @override
  final List<ExaminationEntity> examinations;
  GetExByDateSuccess({required this.examinations});
}
