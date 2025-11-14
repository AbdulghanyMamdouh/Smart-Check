import 'package:smart_check/feature/admin/home/domain/entity/examination_entity.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class GetAllExSuccess extends HomeState {
  List<ExaminationEntity> examinations;
  GetAllExSuccess({
    required this.examinations,
  });
}

class GetAllExError extends HomeState {
  final String errorMessage;

  GetAllExError({required this.errorMessage});
}

class GetAllExLoading extends HomeState {}

class GetExByClIDSuccess extends HomeState {
  List<ExaminationEntity> examinations;
  GetExByClIDSuccess({
    required this.examinations,
  });
}

class GetExByClIDError extends HomeState {
  final String errorMessage;

  GetExByClIDError({required this.errorMessage});
}

class GetExByClIDLoading extends HomeState {}

class GetExByDateSuccess extends HomeState {
  List<ExaminationEntity> examinations;
  GetExByDateSuccess({
    required this.examinations,
  });
}

class GetExByDateError extends HomeState {
  final String errorMessage;

  GetExByDateError({required this.errorMessage});
}

class GetExByDateLoading extends HomeState {}
