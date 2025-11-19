import 'package:smart_check/core/entity/examination_entity.dart';

abstract class DoctorHomeState {}

class HomeInitialState extends DoctorHomeState {}

class GetAllExSuccess extends DoctorHomeState {
  List<ExaminationEntity> examinations;
  GetAllExSuccess({
    required this.examinations,
  });
}

class GetAllExError extends DoctorHomeState {
  final String errorMessage;

  GetAllExError({required this.errorMessage});
}

class GetAllExLoading extends DoctorHomeState {}

class HomeCompleteExaminationLoading extends DoctorHomeState {}

class HomeCompleteExaminationError extends DoctorHomeState {
  final String errMsg;

  HomeCompleteExaminationError({required this.errMsg});
}

class HomeCompleteExaminationSuccess extends DoctorHomeState {
  final String sucMsg;

  HomeCompleteExaminationSuccess({required this.sucMsg});
}

class HomeUpdateExaminationLoading extends DoctorHomeState {}

class HomeUpdateExaminationError extends DoctorHomeState {
  final String errMsg;

  HomeUpdateExaminationError({required this.errMsg});
}

class HomeUpdateExaminationIdError extends DoctorHomeState {
  final String errMsg;

  HomeUpdateExaminationIdError({required this.errMsg});
}

class HomeUpdateExaminationSuccess extends DoctorHomeState {
  final String sucMsg;

  HomeUpdateExaminationSuccess({required this.sucMsg});
}
