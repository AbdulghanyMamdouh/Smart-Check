import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/core/widgets/easy_date_package.dart';
import 'package:smart_check/feature/admin/home/presentation/view/widget/condition_item.dart';
import 'package:smart_check/feature/admin/home/presentation/view_model/home_view_model.dart';
import 'package:smart_check/feature/admin/home/presentation/view_model/home_state.dart';
import 'package:smart_check/feature/admin/manager/presentation/view/screens/manager_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    final branchName = ModalRoute.of(context)?.settings.arguments as String;
    var viewModel = context.read<HomeViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.getAllExaminations(
        branchName: branchName,
        dateTime: DateTime.now(),
      );
    });

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(ManagerScreen.routeName).then((_) {
            viewModel.getAllExaminations(
              dateTime: DateTime.now(),
              branchName: branchName,
            );
          });
        },
        backgroundColor: ColorManager.darkPrimary,
        child: Icon(
          Icons.manage_accounts,
          size: 30.sp,
          color: ColorManager.white,
        ),
      ),
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color.fromARGB(226, 55, 145, 228),
        foregroundColor: ColorManager.white,
        title: Text(
          branchName,
          style: TextStyle(color: ColorManager.white),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // EasyDate Widget Connected with Bloc
            EasyDatePackage(
              onDateChange: (selectedDate) {
                viewModel.getAllExaminations(
                  branchName: branchName,
                  dateTime: selectedDate,
                );
              },
            ),

            // BlocBuilder Showing the Result List
            BlocBuilder<HomeViewModel, HomeState>(
              bloc: viewModel,
              builder: (context, state) {
                if (state is GetAllExLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GetAllExError) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          state.errorMessage,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (state is GetAllExSuccess) {
                  if (state.examinations.isEmpty || state.examinations == []) {
                    return Padding(
                      padding: EdgeInsets.only(top: 50.h),
                      child: Center(
                        child: Image.asset('assets/images/lab.png'),
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

      // bottomNavigationBar: customBottomNavigationBar(context: context),
    );
  }
}
