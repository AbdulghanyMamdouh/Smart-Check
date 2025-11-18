import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smart_check/feature/admin/home/domain/use_case/home_use_case.dart';
import 'package:smart_check/feature/admin/home/presentation/view_model/home_state.dart';

class HomeViewModel extends Cubit<HomeState> {
  final HomeUseCase homeUseCase;

  var formKey = GlobalKey<FormState>();
  HomeViewModel({
    required this.homeUseCase,
  }) : super(HomeInitialState());

  Future<void> getAllExaminations({
    required String branchName,
    required DateTime dateTime,
  }) async {
    emit(GetAllExLoading());
    final either = await homeUseCase.getAllExaminations(
      branchName: branchName,
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
}
