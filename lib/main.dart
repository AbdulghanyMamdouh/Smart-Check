import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_check/core/app_bloc_observer.dart';
import 'package:smart_check/core/di/di.dart';
import 'package:smart_check/core/utils/shared_preference_utils.dart';
import 'package:smart_check/feature/admin/home/presentation/view/screens/fragment_screen.dart';
import 'package:smart_check/feature/auth/presentation/view/login_admin_screen.dart';
import 'package:smart_check/feature/doctor/home/presentation/view/screens/doctor_home_screen.dart';
import 'package:smart_check/smart_check_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await SharedPreferenceUtils.init();
  var token = SharedPreferenceUtils.getData(key: 'token');
  var login = SharedPreferenceUtils.getData(key: 'login');
  bool isExpired = await isTokenExpired();
  String? initialRoute;
  if (login == null || token == null || isExpired) {
    initialRoute = LoginAdminScreen.routeName;
  } else {
    if (login == 'emp' && !isExpired) {
      initialRoute = DoctorHomeScreen.routeName;
    } else if (login == 'admin' && !isExpired) {
      initialRoute = FragmentScreen.routeName;
    } else {
      initialRoute = LoginAdminScreen.routeName;
    }
  }
  runApp(SmartCheckApp(initialRoute: initialRoute));
}
