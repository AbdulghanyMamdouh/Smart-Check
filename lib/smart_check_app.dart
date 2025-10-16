import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/feature/auth/presentation/view/login_screen.dart';

class SmartCheckApp extends StatelessWidget {
  const SmartCheckApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Smart Check',
        routes: {LoginScreen.routName: (_) => LoginScreen()},
        initialRoute: LoginScreen.routName,
      ),
    );
  }
}
