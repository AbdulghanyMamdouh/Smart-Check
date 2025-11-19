import 'package:dartz/dartz.dart';
import 'package:smart_check/core/di/di.dart';

import 'package:dio/dio.dart';
import 'package:smart_check/core/constants/api_constatnt.dart';
import 'package:smart_check/core/utils/failure.dart';
import 'package:smart_check/feature/doctor/add_condition/data/models/add_examination_request_dto.dart';

class AddExaminationApiManager {
  AddExaminationApiManager._();
  static AddExaminationApiManager? _instance;
  static AddExaminationApiManager getInstance() {
    _instance ??= AddExaminationApiManager._();
    return _instance!;
  }

  Future<Either<Failures, String>> addExamination(
    AddExaminationRequestDto examination,
  ) async {
    bool connected = await isConnected();

    if (connected) {
      try {
        print("=== ADD EXAM REQUEST ===");
        print(examination.toJson());

        final response = await dio.post(
          ApiConstant.addExamination,
          data: examination.toJson(),
        );
        print("=== RESPONSE ===");
        print(response.statusCode);
        print(response.data);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right('تم تسجيل الحالة بنجاح');
        } else {
          return Left(
            ServerError(
              errorMessage: response.data["mess"] ?? response.statusMessage,
            ),
          );
        }
      } on DioException catch (error) {
        print("=== DioException ===");
        print(error.response?.data);
        print(error.response?.statusCode);
        return Left(
          ServerError(
            errorMessage: error.message ?? error.toString(),
          ),
        );
      } catch (e) {
        return Left(ServerError(errorMessage: e.toString()));
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
