import 'package:dio/dio.dart';
import 'package:smart_check/core/constants/api_constatnt.dart';
import 'package:smart_check/core/utils/shared_preference_utils.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

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
                if (token != null) options.headers['token'] = token;
                return handler.next(options);
              },
        ),
      );
