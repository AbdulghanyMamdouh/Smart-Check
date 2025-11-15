import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_check/feature/admin/home/presentation/view/screens/fragment_screen.dart';
import 'package:smart_check/feature/auth/presentation/view/login_admin_screen.dart';
import 'package:smart_check/feature/admin/home/presentation/view/screens/home_screen.dart';
import 'package:smart_check/feature/admin/manager/presentation/view/screens/manager_screen.dart';
import 'package:smart_check/feature/admin/statistics/presentation/view/screens/statistic_screen.dart';
import 'package:smart_check/feature/auth/presentation/view/login_emp_screen.dart';
import 'package:smart_check/feature/doctor/add_condition/presentation/view/screens/add_condition_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:smart_check/feature/doctor/home/presentation/view/screens/condition_details_screen.dart';
import 'package:smart_check/feature/doctor/home/presentation/view/screens/doctor_home_screen.dart';

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
          LoginAdminScreen.routeName: (_) => LoginAdminScreen(),
          HomeScreen.routeName: (_) => HomeScreen(),
          ManagerScreen.routeName: (_) => ManagerScreen(),
          StatisticScreen.routeName: (_) => StatisticScreen(),
          AddConditionScreen.routeName: (_) => AddConditionScreen(),
          DoctorHomeScreen.routeName: (_) => DoctorHomeScreen(),
          ConditionDetailsScreen.routeName: (_) => ConditionDetailsScreen(),
          FragmentScreen.routeName: (_) => FragmentScreen(),
          LoginEmpScreen.routeName: (_) => LoginEmpScreen(),
        },
        initialRoute: DoctorHomeScreen.routeName,
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
