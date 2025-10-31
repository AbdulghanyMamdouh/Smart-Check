import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_check/feature/auth/presentation/view/login_screen.dart';
import 'package:smart_check/feature/admin/home/presentation/view/screens/home_screen.dart';
import 'package:smart_check/feature/admin/manager/presentation/view/screens/manager_screen.dart';
import 'package:smart_check/feature/admin/statistics/presentation/view/screens/statistic_screen.dart';
import 'package:smart_check/feature/doctor/add_condition/presentation/view/screens/add_condition_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class SmartCheckApp extends StatelessWidget {
  const SmartCheckApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Smart Check',
        theme: ThemeData(
          textTheme: GoogleFonts.cairoTextTheme(),
        ),
        routes: {
          LoginScreen.routeName: (_) => LoginScreen(),
          HomeScreen.routeName: (_) => HomeScreen(),
          ManagerScreen.routeName: (_) => ManagerScreen(),
          StatisticScreen.routeName: (_) => StatisticScreen(),
          AddConditionScreen.routeName: (_) => AddConditionScreen(),
        },
        initialRoute: AddConditionScreen.routeName,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar'),
          Locale('en'),
        ],
      ),
    );
  }
}
