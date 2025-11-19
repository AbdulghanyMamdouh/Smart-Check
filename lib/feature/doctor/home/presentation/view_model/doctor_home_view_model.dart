import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_check/core/utils/shared_preference_utils.dart';
import 'package:smart_check/feature/doctor/home/domain/entity/complete_examination_request_entity.dart';
import 'package:smart_check/feature/doctor/home/domain/use_case/manage_examination_use_case.dart';
import 'package:smart_check/feature/doctor/home/presentation/view_model/doctor_home_state.dart';

class DoctorHomeViewModel extends Cubit<DoctorHomeState> {
  DoctorHomeViewModel({
    required this.manageExaminationUseCase,
  }) : super(HomeInitialState());
  final ManageExaminationUseCase manageExaminationUseCase;
  int? examinationId;
  var lastAntibiotic = TextEditingController();
  var immunisationProgram = TextEditingController();
  var anatomy = TextEditingController();
  var diagnosis = TextEditingController();
  var treatment = TextEditingController();
  var key = TextEditingController();
  var value = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? empBranchName;
  void clearInputs() {
    lastAntibiotic.clear();
    immunisationProgram.clear();
    anatomy.clear();
    diagnosis.clear();
    treatment.clear();
  }

  Future<void> getAllExaminations({
    required DateTime dateTime,
  }) async {
    empBranchName = SharedPreferenceUtils.getData(key: 'branch') as String;
    if (empBranchName == null || empBranchName == '') {
      emit(
        GetAllExError(
          errorMessage: 'logout please and relogin',
        ),
      );
    }
    emit(GetAllExLoading());
    final either = await manageExaminationUseCase.getAllExaminations(
      branchName: empBranchName ?? 'دمنهور',
      dateTime: dateTime,
    );
    either.fold(
      (failure) {
        emit(
          GetAllExError(
            errorMessage: failure.errorMessage!,
          ),
        );
      },
      (examinations) {
        emit(
          GetAllExSuccess(
            examinations: examinations,
          ),
        );
      },
    );
  }

  Future<void> updateExamination({
    required CompleteExaminationRequestEntity examination,
  }) async {
    if (examination.examinationId == null) {
      emit(HomeUpdateExaminationIdError(errMsg: "Examination ID is missing"));
      return;
    }

    emit(HomeUpdateExaminationLoading());
    final either = await manageExaminationUseCase.updateExamination(
      examinationRequest: examination,
    );
    either.fold(
      (failure) {
        emit(
          HomeUpdateExaminationError(errMsg: failure.errorMessage!),
        );
      },
      (sucMsg) {
        emit(
          HomeUpdateExaminationSuccess(sucMsg: sucMsg),
        );
      },
    );
  }

  Future<void> completeExamination() async {
    if (examinationId == null) {
      emit(HomeCompleteExaminationError(errMsg: "Examination ID is missing"));
      return;
    }
    if (formKey.currentState?.validate() ?? false) {
      final examinationRequest = CompleteExaminationRequestEntity(
        anatomy: anatomy.text.trim(),
        diagnosis: diagnosis.text.trim(),
        examinationId: examinationId,
        immunisationProgram: immunisationProgram.text.trim(),
        lastAntibiotic: lastAntibiotic.text.trim(),
        treatment: treatment.text.trim(),
      );
      emit(HomeCompleteExaminationLoading());
      final either = await manageExaminationUseCase.completeExamination(
        examinationRequest: examinationRequest,
      );
      either.fold(
        (failure) {
          emit(
            HomeCompleteExaminationError(errMsg: failure.errorMessage!),
          );
        },
        (sucMsg) {
          emit(
            HomeCompleteExaminationSuccess(sucMsg: sucMsg),
          );
          clearInputs();
        },
      );
    }
  }

  @override
  Future<void> close() {
    lastAntibiotic.dispose();
    immunisationProgram.dispose();
    anatomy.dispose();
    diagnosis.dispose();
    treatment.dispose();
    key.dispose();
    value.dispose();
    return super.close();
  }
}
