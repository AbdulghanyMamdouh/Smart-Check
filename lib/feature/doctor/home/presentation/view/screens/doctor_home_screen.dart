import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/core/utils/shared_preference_utils.dart';
import 'package:smart_check/core/widgets/easy_date_package.dart';
import 'package:smart_check/feature/auth/presentation/view/login_admin_screen.dart';
import 'package:smart_check/feature/doctor/add_condition/presentation/view/screens/add_condition_screen.dart';
import 'package:smart_check/feature/doctor/home/presentation/view/widgets/condition_item.dart';
import 'package:smart_check/feature/doctor/home/presentation/view_model/doctor_home_state.dart';
import 'package:smart_check/feature/doctor/home/presentation/view_model/doctor_home_view_model.dart';
import 'package:smart_check/feature/search/presentation/view/screens/search_screen.dart';

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({super.key});
  static const String routeName = 'doctor_home';
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        DoctorHomeViewModel viewModel = context.read<DoctorHomeViewModel>();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          viewModel.getAllExaminations(
            dateTime: DateTime.now(),
          );
        });
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(
                context,
              ).pushNamed(AddConditionScreen.routeName).then((_) {
                viewModel.getAllExaminations(
                  dateTime: DateTime.now(),
                );
              });
            },
            backgroundColor: ColorManager.darkPrimary,
            child: Icon(
              Icons.add,
              size: 38.sp,
              color: ColorManager.white,
            ),
          ),
          appBar: AppBar(
            centerTitle: false,
            backgroundColor: const Color.fromARGB(226, 55, 145, 228),
            foregroundColor: ColorManager.white,
            leading: IconButton(
              onPressed: () async {
                await SharedPreferenceUtils.removeDate(key: 'token');
                await SharedPreferenceUtils.removeDate(key: 'login');
                await SharedPreferenceUtils.removeDate(key: 'token_saved_at');
                await SharedPreferenceUtils.removeDate(key: 'branch');

                if (!context.mounted) return;
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  LoginAdminScreen.routeName,
                  (route) => false,
                );
              },
              icon: Icon(
                Icons.logout_outlined,
                size: 34.sp,
              ),
            ),
            title: Text(
              'الحالات المسجلة',
              style: TextStyle(
                color: ColorManager.white,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(
                    context,
                  ).pushNamed(SearchScreen.routeName);
                },
                icon: Icon(
                  Icons.content_paste_search_rounded,
                  size: 34.sp,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                EasyDatePackage(
                  onDateChange: (selectedDate) {
                    viewModel.getAllExaminations(
                      dateTime: selectedDate,
                    );
                  },
                ),
                BlocBuilder<DoctorHomeViewModel, DoctorHomeState>(
                  bloc: viewModel,
                  builder: (context, state) {
                    if (state is GetAllExLoading) {
                      return const Padding(
                        padding: EdgeInsetsGeometry.all(30),

                        child: CircularProgressIndicator(),
                      );
                    } else if (state is GetAllExError) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Text(
                            state.errorMessage,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      );
                    } else if (state is GetAllExSuccess) {
                      if (state.examinations.isEmpty ||
                          state.examinations == []) {
                        return Padding(
                          padding: EdgeInsets.only(top: 50.h),

                          child: Center(
                            child: Image.asset(
                              'assets/images/lab.png',
                            ),
                          ),
                        );
                      } else {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.only(top: 16.h),
                          itemCount: state.examinations.length,
                          itemBuilder: (_, index) {
                            return ConditionItem(
                              examinationEntity: state.examinations[index],
                            );
                          },
                        );
                      }
                    } else {
                      return Center(
                        child: Image.asset('assets/images/lab.png'),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
