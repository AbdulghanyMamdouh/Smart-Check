import 'package:dio/dio.dart';
import 'package:smart_check/core/constants/api_constatnt.dart';
import 'package:smart_check/core/utils/shared_preference_utils.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:smart_check/feature/admin/home/data/manager/home_api_manager.dart';
import 'package:smart_check/feature/admin/home/data/repository/data_source/home_remote_api_data_source_impl.dart';
import 'package:smart_check/feature/admin/home/data/repository/repo/home_remote_repository_impl.dart';
import 'package:smart_check/feature/admin/home/domain/repository/data_source/home_data_sourec_contract.dart';
import 'package:smart_check/feature/admin/home/domain/repository/repo/home_repository_contract.dart';
import 'package:smart_check/feature/admin/home/domain/use_case/home_use_case.dart';
import 'package:smart_check/feature/admin/manager/data/manager/manager_api_manager.dart';
import 'package:smart_check/feature/admin/manager/data/repository/data_source/manager_remote_api_data_source_impl.dart';
import 'package:smart_check/feature/admin/manager/data/repository/repo/manager_remote_repository_impl.dart';
import 'package:smart_check/feature/admin/manager/domain/repository/data_source/manager_remote_data_source_contract.dart';
import 'package:smart_check/feature/admin/manager/domain/repository/repo/manager_repository_contract.dart';
import 'package:smart_check/feature/admin/manager/domain/use_case/manager_employee_use_case.dart';
import 'package:smart_check/feature/auth/data/manager/login_api_manager.dart';
import 'package:smart_check/feature/auth/data/repository/data_source/auth_remote_api_data_source_impl.dart';
import 'package:smart_check/feature/auth/data/repository/repo/auth_remote_repository_impl.dart';
import 'package:smart_check/feature/auth/domain/repository/data_source/auth_remote_data_source_contract.dart';
import 'package:smart_check/feature/auth/domain/repository/repo/auth_login_repository_contract.dart';
import 'package:smart_check/feature/auth/domain/use_case/login_use_case.dart';
import 'package:smart_check/feature/doctor/add_condition/data/manager/add_examination_api_manager.dart';
import 'package:smart_check/feature/doctor/add_condition/data/repository/data_source/add_examination_remote_api_data_source_impl.dart';
import 'package:smart_check/feature/doctor/add_condition/data/repository/repo/add_examination_repository_impl.dart';
import 'package:smart_check/feature/doctor/add_condition/domain/repository/data_source/add_examination_remote_data_source_contract.dart';
import 'package:smart_check/feature/doctor/add_condition/domain/repository/repo/add_examination_repository_contract.dart';
import 'package:smart_check/feature/doctor/add_condition/domain/use_case/add_examination_use_Case.dart';
import 'package:smart_check/feature/doctor/home/data/manager/home_doctor_api_manager.dart';
import 'package:smart_check/feature/doctor/home/data/repository/data_source/manage_examination_remote_api_data_source_impl.dart';
import 'package:smart_check/feature/doctor/home/data/repository/repo/manage_examintion_repository_impl.dart';
import 'package:smart_check/feature/doctor/home/domain/repository/data_source/manage_examination_remote_data_source_contract.dart';
import 'package:smart_check/feature/doctor/home/domain/repository/repo/manage_examination_repository_contract.dart';
import 'package:smart_check/feature/doctor/home/domain/use_case/manage_examination_use_case.dart';
import 'package:smart_check/feature/search/data/manager/search_api_manager.dart';
import 'package:smart_check/feature/search/data/repository/data_source/search_remote_api_data_source_impl.dart';
import 'package:smart_check/feature/search/data/repository/repo/search_repository_impl.dart';
import 'package:smart_check/feature/search/domain/repository/data_source/search_remote_data_source_contract.dart';
import 'package:smart_check/feature/search/domain/repository/repo/search_repository_contract.dart';
import 'package:smart_check/feature/search/domain/use_case/search_use_case.dart';

SearchUseCase injectSearchUseCase() {
  return SearchUseCase(
    searchRepositoryContract: injectSearchRepositoryContract(),
  );
}

SearchRepositoryContract injectSearchRepositoryContract() {
  return SearchRepositoryImpl(
    searchRemoteDataSourceContract: injectSearchRemoteDataSourceContract(),
  );
}

SearchRemoteDataSourceContract injectSearchRemoteDataSourceContract() {
  return SearchRemoteApiDataSourceImpl(
    searchApiManager: SearchApiManager.getInstance(),
  );
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(authRepositoryContract: injectAuthRepositoryContract());
}

AuthRepositoryContract injectAuthRepositoryContract() {
  return AuthRemoteRepositoryImpl(
    authRemoteDataSourceContract: injectAuthRemoteDataSourceContract(),
  );
}

AuthRemoteDataSourceContract injectAuthRemoteDataSourceContract() {
  return AuthRemoteApiDataSourceImpl(
    loginApiManager: LoginApiManager.getInstance(),
  );
}

ManagerEmployeeUseCase injectAddEmployeeUseCase() {
  return ManagerEmployeeUseCase(
    managerRepositoryContract: injectManagerRepositoryContract(),
  );
}

ManagerRepositoryContract injectManagerRepositoryContract() {
  return ManagerRemoteRepositoryImpl(
    managerRemoteDataSourceContract: injectManagerRemoteDataSourceContract(),
  );
}

ManagerRemoteDataSourceContract injectManagerRemoteDataSourceContract() {
  return ManagerRemoteApiDataSourceImpl(
    managerApiManager: ManagerApiManager.getInstance(),
  );
}

AddExaminationUseCase injectAddExaminationUseCase() {
  return AddExaminationUseCase(
    addExaminationRepositoryContract: injectAddExaminationRepositoryContract(),
  );
}

AddExaminationRepositoryContract injectAddExaminationRepositoryContract() {
  return AddExaminationRepositoryImpl(
    addExaminationRemoteDataSourceContract:
        injectAddExaminationRemoteDataSourceContract(),
  );
}

AddExaminationRemoteDataSourceContract
injectAddExaminationRemoteDataSourceContract() {
  return AddConditionRemoteApiDataSourceImpl(
    addExaminationApiManager: AddExaminationApiManager.getInstance(),
  );
}

HomeUseCase injectHomeUseCase() {
  return HomeUseCase(homeRepositoryContract: injectHomeRepositoryContract());
}

HomeRepositoryContract injectHomeRepositoryContract() {
  return HomeRemoteRepositoryImpl(
    homeDataSourecContract: injectHomeDataSourecContract(),
  );
}

HomeDataSourecContract injectHomeDataSourecContract() {
  return HomeRemoteApiDataSourceImpl(
    homeApiManager: HomeApiManager.getInstance(),
  );
}

ManageExaminationUseCase injectManageExaminationUseCase() {
  return ManageExaminationUseCase(
    manageExaminationRepositoryContract:
        injectManageExaminationRepositoryContract(),
  );
}

ManageExaminationRepositoryContract
injectManageExaminationRepositoryContract() {
  return ManageExamintionRepositoryImpl(
    manageExaminationRemoteDataSourceContract:
        injectManageExaminationRemoteDataSourceContract(),
  );
}

ManageExaminationRemoteDataSourceContract
injectManageExaminationRemoteDataSourceContract() {
  return ManageExaminationRemoteApiDataSourceImpl(
    homeApiManager: HomeDoctorApiManager.getInstance(),
  );
}

Future<bool> isConnected() async {
  var connectivityResults = await Connectivity()
      .checkConnectivity(); // User defined class
  if (connectivityResults.contains(ConnectivityResult.mobile) ||
      connectivityResults.contains(ConnectivityResult.wifi)) {
    return true;
  } else {
    return false;
  }
}

final dio =
    Dio(
        BaseOptions(
          baseUrl: ApiConstant.baseURL,
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      )
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest:
              (
                RequestOptions options,
                RequestInterceptorHandler handler,
              ) async {
                // Do something before request is sent.
                // If you want to resolve the request with custom data,
                // you can resolve a `Response` using `handler.resolve(response)`.
                // If you want to reject the request with a error message,
                // you can reject with a `DioException` using `handler.reject(dioError)`.
                final token = SharedPreferenceUtils.getData(key: 'token');

                if (token != null) {
                  print('\n===============\ntoken not null');
                  options.headers = {
                    'Authorization': 'Bearer $token',
                    'Content-Type': 'application/json',
                  };
                } else {
                  print("TOKEN SENT is null = ${token.toString()}");
                }
                print("TOKEN SENT = ${token.toString()}");
                print("HEADERS = ${options.headers}");

                return handler.next(options);
              },
        ),
      );
