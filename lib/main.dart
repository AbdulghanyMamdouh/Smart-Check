import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_check/core/app_bloc_observer.dart';
import 'package:smart_check/core/utils/shared_preference_utils.dart';
import 'package:smart_check/smart_check_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await SharedPreferenceUtils.init();
  runApp(const SmartCheckApp());
}
