import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/core/utils/error_utils.dart';
import 'package:smart_check/core/utils/loading_indicator.dart';
import 'package:smart_check/feature/admin/manager/presentation/view/widgets/add_employee_bottom_sheet.dart';
import 'package:smart_check/feature/admin/manager/presentation/view/widgets/employee_item.dart';
import 'package:smart_check/feature/admin/manager/presentation/view_model/manager_states.dart';
import 'package:smart_check/feature/admin/manager/presentation/view_model/manager_view_model.dart';

class ManagerScreen extends StatelessWidget {
  const ManagerScreen({super.key});
  static const String routeName = 'manager';
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        var viewModel = context.read<ManagerViewModel>();
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromARGB(226, 55, 145, 228),

            title: Text(
              'إدارة الموظفين',
              style: TextStyle(
                color: ColorManager.white,
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.r),
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => AddEmployeeBottomSheet(
                  viewModel: viewModel,
                ),
              );
            },
            backgroundColor: ColorManager.darkPrimary,
            child: Icon(
              Icons.add,
              size: 38.sp,
              color: ColorManager.white,
            ),
          ),
          body: BlocBuilder<ManagerViewModel, ManagerStates>(
            bloc: viewModel..getAllEmployee(),
            builder: (context, state) {
              if (state is GetEmployeesLoading) {
                return LoadingIndicator();
              } else if (state is GetEmployeesError) {
                return ErrorUtils(errorMsg: state.errMsg);
              } else if (state is GetEmployeesSuccess) {
                return Container(
                  padding: EdgeInsets.only(top: 25.h, left: 12.w, right: 12.w),
                  child: ListView.builder(
                    itemCount: state.employees.length,
                    itemBuilder: (_, index) => EmployeeItem(
                      employeeEntity: state.employees[index],
                    ),
                  ),
                );
              } else {
                return SizedBox();
              }
            },
          ),
        );
      },
    );
  }
}
