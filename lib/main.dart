import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:smart_check/core/app_bloc_observer.dart';
import 'package:smart_check/smart_check_app.dart';

void main() {
  Bloc.observer = AppBlocObserver();

  runApp(const SmartCheckApp());
}
