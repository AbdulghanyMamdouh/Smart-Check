abstract class ManagerStates {}

class ManagerInitial extends ManagerStates {}

class AddEmployeeLoading extends ManagerStates {}

class AddEmployeeSuccess extends ManagerStates {
  final String sucMsg;

  AddEmployeeSuccess({required this.sucMsg});
}

class AddEmployeeError extends ManagerStates {
  final String errMsg;

  AddEmployeeError({required this.errMsg});
}
