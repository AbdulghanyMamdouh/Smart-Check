import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_check/feature/admin/manager/domain/use_case/add_employee_use_case.dart';
import 'package:smart_check/feature/admin/manager/presentation/view_model/manager_states.dart';

class ManagerViewModel extends Cubit<ManagerStates> {
  final AddEmployeeUseCase addEmployeeUseCase;
  ManagerViewModel({
    required this.addEmployeeUseCase,
  }) : super(ManagerInitial());
  var userName = TextEditingController();
  var password = TextEditingController();
  var branchName = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void clearInputs() {
    branchName.clear();
    userName.clear();
    password.clear();
  }

  Future<void> addEmployee() async {
    if (formKey.currentState?.validate() ?? false) {
      emit(AddEmployeeLoading());
      final either = await addEmployeeUseCase.addEmployee(
        userName: userName.text.trim(),
        password: password.text.trim(),
        branchName: branchName.text.trim(),
      );
      either.fold(
        (failure) {
          emit(
            AddEmployeeError(errMsg: failure.errorMessage!),
          );
        },
        (sucMsg) {
          emit(
            AddEmployeeSuccess(sucMsg: sucMsg),
          );
          clearInputs();
        },
      );
    }
  }

  @override
  Future<void> close() {
    branchName.dispose();
    userName.dispose();
    password.dispose();
    return super.close();
  }
}