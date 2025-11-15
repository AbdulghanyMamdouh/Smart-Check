abstract class AddExaminationStates {}

class AddExaminationInitialState extends AddExaminationStates {}

class AddExaminationLoading extends AddExaminationStates {}

class AddExaminationSuccess extends AddExaminationStates {
  final String sucMsg;

  AddExaminationSuccess({required this.sucMsg});
}

class AddExaminationError extends AddExaminationStates {
  final String errMsg;

  AddExaminationError({required this.errMsg});
}
