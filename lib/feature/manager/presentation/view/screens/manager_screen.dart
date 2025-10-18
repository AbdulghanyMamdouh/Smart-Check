import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/core/widgets/custom_app_bar.dart';
import 'package:smart_check/feature/manager/presentation/view/widgets/add_employee_bottom_sheet.dart';
import 'package:smart_check/feature/manager/presentation/view/widgets/employee_item.dart';

class ManagerScreen extends StatelessWidget {
  const ManagerScreen({super.key});
  static const String routeName = 'manager';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 25.h, left: 12.w, right: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 44.sp,
                    color: ColorManager.darkPrimary,
                  ),
                ),
                CustomAppBar(title: 'Manager', width: 170.w),
                SizedBox(width: 50.w),
                Container(
                  decoration: BoxDecoration(
                    color: ColorManager.darkPrimary,

                    borderRadius: BorderRadius.circular(44.r),
                  ),
                  child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => AddEmployeeBottomSheet(),
                      );
                    },
                    icon: Icon(
                      Icons.add,
                      size: 44.sp,
                      color: ColorManager.primary,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (_, index) => EmployeeItem(branchName: 'Damnhur'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
