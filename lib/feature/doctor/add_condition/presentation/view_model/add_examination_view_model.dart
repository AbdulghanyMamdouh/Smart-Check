import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_check/feature/doctor/add_condition/domain/entity/add_examination_request_entity.dart';
import 'package:smart_check/feature/doctor/add_condition/domain/use_case/add_examination_use_Case.dart';
import 'package:smart_check/feature/doctor/add_condition/presentation/view_model/add_examination_states.dart';

class AddExaminationViewModel extends Cubit<AddExaminationStates> {
  AddExaminationViewModel({
    required this.addExaminationUseCase,
  }) : super(AddExaminationInitialState());

  final clientName = TextEditingController();
  final clientPhone = TextEditingController();
  final clientCode = TextEditingController();
  final clientAddress = TextEditingController();
  final herdType = TextEditingController();
  final herdAgeInDays = TextEditingController();
  final herdCount = TextEditingController();
  final herdFeedPerDay = TextEditingController();
  final herdWaterPerDay = TextEditingController();
  final herdDied = TextEditingController();
  final compliant = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final AddExaminationUseCase addExaminationUseCase;

  void clearInputs() {
    clientName.clear();
    clientPhone.clear();
    clientCode.clear();
    clientAddress.clear();
    herdType.clear();
    herdAgeInDays.clear();
    herdCount.clear();
    herdFeedPerDay.clear();
    herdWaterPerDay.clear();
    herdDied.clear();
    compliant.clear();
  }

  Future<void> addExamination() async {
    if (formKey.currentState?.validate() ?? false) {
      emit(AddExaminationLoading());
      AddExaminationRequestEntity examinationRequest =
          AddExaminationRequestEntity(
            clientAddress: clientAddress.text.trim(),
            clientCode: clientCode.text.trim(),
            clientName: clientName.text.trim(),
            clientPhone: clientPhone.text.trim(),
            compliant: compliant.text.trim(),
            herdAgeInDays: herdAgeInDays.text.trim(),
            herdCount: herdCount.text.trim(),
            herdDied: herdDied.text.trim(),
            herdFeedPerDay: herdFeedPerDay.text.trim(),
            herdType: herdType.text.trim(),
            herdWaterPerDay: herdWaterPerDay.text.trim(),
          );
      try {
        var either = await addExaminationUseCase.addExamination(
          examinationRequest: examinationRequest,
        );
        either.fold(
          (failure) {
            emit(
              AddExaminationError(errMsg: failure.errorMessage!),
            );
          },
          (sucMsg) {
            emit(
              AddExaminationSuccess(sucMsg: sucMsg),
            );
            clearInputs();
          },
        );
      } catch (err) {
        emit(
          AddExaminationError(errMsg: err.toString()),
        );
      }
    }
  }

  @override
  Future<void> close() {
    clientName.dispose();
    clientPhone.dispose();
    clientCode.dispose();
    clientAddress.dispose();
    herdType.dispose();
    herdAgeInDays.dispose();
    herdCount.dispose();
    herdFeedPerDay.dispose();
    herdWaterPerDay.dispose();
    herdDied.dispose();
    compliant.dispose();

    return super.close();
  }
}
