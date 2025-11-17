import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_check/feature/auth/domain/use_case/login_use_case.dart';
import 'package:smart_check/feature/auth/presentation/view_model/auth_states.dart';

class AuthViewModel extends Cubit<AuthState> {
  AuthViewModel({required this.loginUseCase}) : super(AuthInitialState());
  final LoginUseCase loginUseCase;
  var adminFormKey = GlobalKey<FormState>();
  var employeeFormKey = GlobalKey<FormState>();
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  void clearInputs() {
    passwordController.clear();
    userNameController.clear();
  }

  Future<void> adminLogin() async {
    if (adminFormKey.currentState?.validate() ?? false) {
      emit(AdminLoginLoading());
      final either = await loginUseCase.adminLogin(
        userName: userNameController.text.trim(),
        password: passwordController.text.trim(),
      );
      either.fold(
        (failure) {
          emit(
            AdminLoginError(
              errorMsg: failure.errorMessage!,
            ),
          );
        },
        (loginResult) {
          emit(AdminLoginSuccess(loginResult: loginResult));
        },
      );
    }
  }

  Future<void> employeeLogin() async {
    if (employeeFormKey.currentState?.validate() ?? false) {
      emit(EmployeeLoginLoading());
      final either = await loginUseCase.employeeLogin(
        userName: userNameController.text.trim(),
        password: passwordController.text.trim(),
      );
      either.fold(
        (failure) {
          emit(
            EmployeeLoginError(
              errorMsg: failure.errorMessage!,
            ),
          );
        },
        (loginResult) {
          emit(EmployeeLoginSuccess(loginResult: loginResult));
        },
      );
    }
  }

  @override
  Future<void> close() {
    passwordController.dispose();
    userNameController.dispose();
    return super.close();
  }
}
