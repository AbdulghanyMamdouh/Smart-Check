import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/core/widgets/custom_app_bar.dart';
import 'package:smart_check/core/widgets/default_button.dart';
import 'package:smart_check/core/widgets/default_text_field.dart';
import 'package:smart_check/feature/manager/presentation/view/widgets/custom_menu.dart';

class AddEmployeeBottomSheet extends StatelessWidget {
  const AddEmployeeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: ColorManager.white,
          border: Border.all(width: 2.w, color: ColorManager.darkPrimary),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(title: 'Add New Employee', width: 300.w),

            DefaultTextField(
              controller: TextEditingController(),
              label: 'Enter Email Address',
            ),
            SizedBox(height: 16.h),
            DefaultTextField(
              controller: TextEditingController(),
              label: 'Enter Password',
            ),
            SizedBox(height: 8.h),

            CustomMenu(),
            SizedBox(height: 8.h),

            DefaultButton(
              icon: Icon(Icons.arrow_forward),
              label: 'Add Employee',
              onPressed: () {},
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
