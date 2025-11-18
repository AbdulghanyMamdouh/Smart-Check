import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_check/feature/search/domain/use_case/search_use_case.dart';
import 'package:smart_check/feature/search/presentation/view_model/search_state.dart';

class SearchViewModel extends Cubit<SearchState> {
  SearchViewModel({required this.searchUseCase}) : super(SearchInitialState());
  final SearchUseCase searchUseCase;

  Future<void> getExaminationsByClientID({required String clientCode}) async {
    emit(GetExByClIDLoading());
    final either = await searchUseCase.getExaminationsByClientId(
      clientCode: clientCode,
    );
    either.fold(
      (failure) {
        emit(
          GetExByClIDError(
            errorMessage: failure.errorMessage ?? 'unknow error',
          ),
        );
      },
      (examinations) {
        emit(GetExByClIDSuccess(examinations: examinations));
      },
    );
  }

  Future<void> getExaminationsByDate({required DateTime dateTime}) async {
    emit(GetExByDateLoading());
    final either = await searchUseCase.getExaminationsByDate(
      dateTime: dateTime,
    );
    either.fold(
      (failure) {
        emit(
          GetExByDateError(
            errorMessage: failure.errorMessage ?? 'unKnown error',
          ),
        );
      },
      (examinations) {
        emit(GetExByDateSuccess(examinations: examinations));
      },
    );
  }
}
