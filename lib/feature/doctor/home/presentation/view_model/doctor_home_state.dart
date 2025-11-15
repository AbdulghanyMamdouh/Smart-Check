abstract class DoctorHomeState {}

class HomeInitialState extends DoctorHomeState {}

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

class HomeUpdateExaminationSuccess extends DoctorHomeState {
  final String sucMsg;

  HomeUpdateExaminationSuccess({required this.sucMsg});
}
