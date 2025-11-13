import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_check/core/constants/api_constatnt.dart';
import 'package:smart_check/core/di/di.dart';
import 'package:smart_check/core/utils/failure.dart';
import 'package:smart_check/feature/auth/data/models/login_request.dart';
import 'package:smart_check/feature/auth/data/models/login_response/login_response.dart';

class LoginApiManager {
  LoginApiManager._();
  static LoginApiManager? _instance;
  static LoginApiManager getInstance() {
    _instance ??= LoginApiManager._();
    return _instance!;
  }

  Future<Either<Failures, LoginResponse>> adminLogin({
    required String userName,
    required String password,
  }) async {
    final loginRequest = LoginRequest(
      password: password,
      username: userName,
    );
    bool connected = await isConnected();
    if (connected) {
      try {
        final response = await dio.post(
          ApiConstatnt.adminLogin,
          data: loginRequest.toJson(),
        );
        if (response.statusCode! >= 200 || response.statusCode! < 300) {
          final loginResponse = LoginResponse.fromJson(response.data);
          return Right(loginResponse);
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

  Future<Either<Failures, LoginResponse>> employeeLogin({
    required String userName,
    required String password,
  }) async {
    final loginRequest = LoginRequest(
      password: password,
      username: userName,
    );
    bool connected = await isConnected();
    if (connected) {
      try {
        final response = await dio.post(
          ApiConstatnt.employeeLogin,
          data: loginRequest.toJson(),
        );
        if (response.statusCode! >= 200 || response.statusCode! < 300) {
          final loginResponse = LoginResponse.fromJson(response.data);
          return Right(loginResponse);
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
