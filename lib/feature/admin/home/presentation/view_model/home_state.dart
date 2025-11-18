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
