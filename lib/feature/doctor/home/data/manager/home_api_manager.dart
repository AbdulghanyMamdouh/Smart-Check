import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_check/core/constants/api_constatnt.dart';
import 'package:smart_check/core/di/di.dart';
import 'package:smart_check/core/utils/failure.dart';
import 'package:smart_check/feature/doctor/home/data/model/complete_examination_request_dto.dart';
import 'package:smart_check/feature/doctor/home/data/model/update_examination_request_dto.dart';

class HomeApiManager {
  HomeApiManager._();
  static HomeApiManager? _instance;
  HomeApiManager getInstance() {
    _instance ?? HomeApiManager._();
    return _instance!;
  }

  Future<Either<Failures, String>> updateExamination({
    required int examinationId,
    required String key,
    required String value,
  }) async {
    bool connected = await isConnected();
    if (connected) {
      final examinationReuest = UpdateExaminationRequestDto(
        id: examinationId,
        key: key,
        value: value,
      );
      try {
        final response = await dio.put(
          ApiConstant.updateExamination,
          data: examinationReuest.toJson(),
        );
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right('تم نحديث الحالة بنجاح');
        } else {
          return Left(
            ServerError(
              errorMessage: response.data["mess"] ?? response.statusMessage,
            ),
          );
        }
      } on DioException catch (error) {
        return Left(
          ServerError(
            errorMessage: error.message ?? error.toString(),
          ),
        );
      }
    } else {
      return Left(
        NetworkError(
          errorMessage: 'check your internet connection.!',
        ),
      );
    }
  }

  Future<Either<Failures, String>> completeExamination(
    CompleteExaminationRequestDto examination,
  ) async {
    bool connected = await isConnected();
    if (connected) {
      try {
        final response = await dio.put(
          ApiConstant.completeExamination,
          data: examination.toJson(),
        );
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right('تم إكمال تسجيل الحالة بنجاح');
        } else {
          return Left(
            ServerError(
              errorMessage: response.data["mess"] ?? response.statusMessage,
            ),
          );
        }
      } on DioException catch (error) {
        return Left(
          ServerError(
            errorMessage: error.message ?? error.toString(),
          ),
        );
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
