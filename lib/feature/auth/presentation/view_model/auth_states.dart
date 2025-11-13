import 'package:smart_check/feature/auth/domain/entity/login_result_entity.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AdminLoginLoading extends AuthState {}

class AdminLoginSuccess extends AuthState {
  final LoginResultEntity loginResult;

  AdminLoginSuccess({
    required this.loginResult,
  });
}

class AdminLoginError extends AuthState {
  final String errorMsg;

  AdminLoginError({required this.errorMsg});
}

class EmployeeLoginLoading extends AuthState {}

class EmployeeLoginSuccess extends AuthState {
  final LoginResultEntity loginResult;

  EmployeeLoginSuccess({
    required this.loginResult,
  });
}

class EmployeeLoginError extends AuthState {
  final String errorMsg;

  EmployeeLoginError({required this.errorMsg});
}
