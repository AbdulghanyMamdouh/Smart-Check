import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:smart_check/core/constants/api_constatnt.dart';
import 'package:smart_check/core/di/di.dart';
import 'package:smart_check/core/utils/failure.dart';
import 'package:smart_check/feature/search/data/model/examination.dart';
import 'package:smart_check/feature/search/data/model/get_examination_by_client_id_request%20copy.dart';
import 'package:smart_check/feature/search/data/model/get_examination_by_date_request.dart';
import 'package:smart_check/feature/search/data/model/get_examination_response.dart';

class SearchApiManager {
  SearchApiManager._();
  static SearchApiManager? _instance;
  static SearchApiManager getInstance() {
    _instance ??= SearchApiManager._();
    return _instance!;
  }

  Future<Either<Failures, List<Examination>>> getExaminationsByDate({
    required DateTime date,
  }) async {
    final connected = await isConnected();
    String selectedDate = DateFormat('yyyy-MM-dd').format(date);
    final request = GetExaminationByDateRequest(date: selectedDate);
    if (connected) {
      try {
        final response = await dio.post(
          ApiConstant.getExaminationsByDate,
          data: request.toJson(),
        );
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          var getExaminationsResponse = GetExaminationResponse.fromJson(
            response.data!,
          );
          return Right(
            getExaminationsResponse.examinations ?? [],
          );
        } else {
          return Left(
            ServerError(
              errorMessage: response.statusMessage ?? 'error from server',
            ),
          );
        }
      } on DioException catch (error) {
        return Left(
          ServerError(errorMessage: error.message ?? error.toString()),
        );
      } catch (error) {
        return Left(ServerError(errorMessage: error.toString()));
      }
    } else {
      return Left(
        NetworkError(errorMessage: 'check your internet connection.!'),
      );
    }
  }

  Future<Either<Failures, List<Examination>>> getExaminationsByClientCode({
    required String clientCode,
  }) async {
    final connected = await isConnected();
    final request = GetExaminationByClientIdRequest(
      clientId: clientCode,
    );
    if (connected) {
      try {
        final response = await dio.post(
          ApiConstant.getExaminationsByClientCode,
          data: request.toJson(),
        );
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          final getExaminationsResponse = GetExaminationResponse.fromJson(
            response.data!,
          );
          return Right(
            getExaminationsResponse.examinations ?? [],
          );
        } else {
          return Left(
            ServerError(
              errorMessage: response.statusMessage ?? 'nmnmn',
            ),
          );
        }
      } on DioException catch (error) {
        return Left(
          ServerError(
            errorMessage: error.message ?? error.toString(),
          ),
        );
      } catch (error) {
        return Left(ServerError(errorMessage: error.toString()));
      }
    } else {
      return Left(
        NetworkError(
          errorMessage: 'check your internet connection.!',
        ),
      );
    }
  }
}
