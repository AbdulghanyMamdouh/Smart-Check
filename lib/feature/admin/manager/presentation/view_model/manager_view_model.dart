import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_check/feature/admin/manager/domain/use_case/manager_employee_use_case.dart';
import 'package:smart_check/feature/admin/manager/presentation/view_model/manager_states.dart';

class ManagerViewModel extends Cubit<ManagerStates> {
  final ManagerEmployeeUseCase addEmployeeUseCase;
  ManagerViewModel({
    required this.addEmployeeUseCase,
  }) : super(ManagerInitial());
  var userName = TextEditingController();
  var password = TextEditingController();
  String? branchName;
  final formKey = GlobalKey<FormState>();
  void clearInputs() {
    userName.clear();
    password.clear();
  }

  Future<void> getAllEmployee() async {
    emit(GetEmployeesLoading());
    final either = await addEmployeeUseCase.getAllEmployees();
    either.fold(
      (failure) {
        emit(GetEmployeesError(errMsg: failure.errorMessage!));
      },
      (response) {
        emit(GetEmployeesSuccess(employees: response));
      },
    );
  }

  Future<void> addEmployee() async {
    if (branchName == null || branchName == '') {
      emit(
        AddEmployeeErrorBranchName(errMsg: 'اختر الفرع لتسجيل موظف جديد'),
      );
    } else if (formKey.currentState?.validate() ?? false) {
      emit(AddEmployeeLoading());
      final either = await addEmployeeUseCase.addEmployee(
        userName: userName.text.trim(),
        password: password.text.trim(),
        branchName: branchName!.trim(),
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
    userName.dispose();
    password.dispose();
    return super.close();
  }
}
