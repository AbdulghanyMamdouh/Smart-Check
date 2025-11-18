import 'package:smart_check/feature/admin/manager/domain/entity/employee_entity.dart';

abstract class ManagerStates {}

class ManagerInitial extends ManagerStates {}

class AddEmployeeLoading extends ManagerStates {}

class GetEmployeesLoading extends ManagerStates {}

class GetEmployeesError extends ManagerStates {
  final String errMsg;

  GetEmployeesError({required this.errMsg});
}

class GetEmployeesSuccess extends ManagerStates {
  final List<EmployeeEntity> employees;

  GetEmployeesSuccess({required this.employees});
}

class AddEmployeeSuccess extends ManagerStates {
  final String sucMsg;

  AddEmployeeSuccess({required this.sucMsg});
}

class AddEmployeeError extends ManagerStates {
  final String errMsg;

  AddEmployeeError({required this.errMsg});
}

class AddEmployeeErrorBranchName extends ManagerStates {
  final String errMsg;

  AddEmployeeErrorBranchName({required this.errMsg});
}
