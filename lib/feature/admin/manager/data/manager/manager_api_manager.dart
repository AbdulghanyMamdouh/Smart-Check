import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_check/core/constants/api_constatnt.dart';
import 'package:smart_check/core/di/di.dart';
import 'package:smart_check/core/utils/failure.dart';
import 'package:smart_check/feature/admin/manager/data/models/add_employee_request_dto.dart';
import 'package:smart_check/feature/admin/manager/data/models/get_employees/employee_dto.dart';
import 'package:smart_check/feature/admin/manager/data/models/get_employees/get_employees_response.dart';

class ManagerApiManager {
  ManagerApiManager._();
  static ManagerApiManager? _instance;
  static ManagerApiManager getInstance() {
    _instance ??= ManagerApiManager._();
    return _instance!;
  }

  Future<Either<Failures, List<EmployeeDto>>> getAllEmployees() async {
    bool connected = await isConnected();
    if (connected) {
      try {
        final response = await dio.get(
          ApiConstant.getAllEmployees,
        );
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          var getEmployeesResponse = GetEmployeesResponse.fromJson(
            response.data,
          );
          return Right(getEmployeesResponse.employees ?? []);
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
      } catch (error) {
        return Left(
          ServerError(
            errorMessage: error.toString(),
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

  Future<Either<Failures, String>> addEmployee({
    required String userName,
    required String branchName,
    required String password,
  }) async {
    bool connected = await isConnected();
    if (connected) {
      try {
        final request = AddEmployeeRequestDto(
          branchName: branchName,
          password: password,
          userName: userName,
        );
        final response = await dio.post(
          ApiConstant.addEmployee,
          data: request.toJson(),
        );
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right('..تمت إضافة دكتور جديد بنجاح');
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
