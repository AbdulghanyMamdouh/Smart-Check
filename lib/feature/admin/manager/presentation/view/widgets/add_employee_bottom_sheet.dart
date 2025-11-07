import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/core/widgets/default_button.dart';
import 'package:smart_check/core/widgets/default_text_field.dart';
import 'package:smart_check/feature/admin/manager/presentation/view/widgets/custom_menu.dart';

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
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            SizedBox(height: 16.h),
            Text(
              'إضافة موظف جديد',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: ColorManager.darkPrimary,
              ),
            ),
            SizedBox(height: 16.h),
            DefaultTextField(
              controller: TextEditingController(),
              label: 'ادخل اسم الموظف',
            ),

            SizedBox(height: 16.h),
            DefaultTextField(
              controller: TextEditingController(),
              label: 'ادخل كلمة المرور',
            ),
            SizedBox(height: 8.h),

            CustomMenu(),
            SizedBox(height: 8.h),

            DefaultButton(
              icon: Icon(Icons.arrow_forward),
              label: 'إضافة الموظف',
              onPressed: () {},
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
