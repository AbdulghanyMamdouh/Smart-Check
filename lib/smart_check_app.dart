import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_check/core/di/di.dart';
import 'package:smart_check/feature/admin/home/presentation/view/screens/admin_condition_details_screen.dart';
import 'package:smart_check/feature/admin/home/presentation/view/screens/fragment_screen.dart';
import 'package:smart_check/feature/admin/home/presentation/view_model/home_view_model.dart';
import 'package:smart_check/feature/admin/manager/presentation/view_model/manager_view_model.dart';
import 'package:smart_check/feature/auth/presentation/view/login_admin_screen.dart';
import 'package:smart_check/feature/admin/home/presentation/view/screens/home_screen.dart';
import 'package:smart_check/feature/admin/manager/presentation/view/screens/manager_screen.dart';
import 'package:smart_check/feature/auth/presentation/view/login_emp_screen.dart';
import 'package:smart_check/feature/doctor/add_condition/presentation/view/screens/add_condition_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:smart_check/feature/doctor/home/presentation/view/screens/doctor_condition_details_screen.dart';
import 'package:smart_check/feature/doctor/home/presentation/view/screens/doctor_home_screen.dart';
import 'package:smart_check/feature/doctor/home/presentation/view_model/doctor_home_view_model.dart';
import 'package:smart_check/feature/search/presentation/view/screens/search_screen.dart';
import 'package:smart_check/feature/search/presentation/view_model/search_view_model.dart';

class SmartCheckApp extends StatelessWidget {
  const SmartCheckApp({super.key, required this.initialRoute});
  final String initialRoute;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DoctorHomeViewModel(
              manageExaminationUseCase: injectManageExaminationUseCase(),
            ),
          ),
          BlocProvider(
            create: (context) => SearchViewModel(
              searchUseCase: injectSearchUseCase(),
            ),
          ),
          BlocProvider(
            create: (context) => HomeViewModel(
              homeUseCase: injectHomeUseCase(),
            ),
          ),

          BlocProvider(
            create: (context) => ManagerViewModel(
              addEmployeeUseCase: injectAddEmployeeUseCase(),
            ),
          ),
        ],
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
            AddConditionScreen.routeName: (_) => AddConditionScreen(),
            DoctorHomeScreen.routeName: (_) => DoctorHomeScreen(),
            DoctorConditionDetailsScreen.routeName: (_) =>
                DoctorConditionDetailsScreen(),
            AdminConditionDetailsScreen.routeName: (_) =>
                AdminConditionDetailsScreen(),
            FragmentScreen.routeName: (_) => FragmentScreen(),
            LoginEmpScreen.routeName: (_) => LoginEmpScreen(),
            SearchScreen.routeName: (_) => SearchScreen(),
          },
          initialRoute: initialRoute,
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
      ),
    );
  }
}
