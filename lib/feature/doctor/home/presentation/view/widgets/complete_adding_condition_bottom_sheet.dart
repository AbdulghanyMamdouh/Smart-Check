import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/core/widgets/default_button.dart';
import 'package:smart_check/feature/doctor/home/presentation/view/widgets/additional_program_section.dart';
import 'package:smart_check/feature/doctor/home/presentation/view/widgets/care_program_section.dart';

class CompleteAddingConditionBottomSheet extends StatelessWidget {
  const CompleteAddingConditionBottomSheet({super.key});

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
          spacing: 10.h,
          children: [
            Text(
              'إكمال تسجيل الحالة',
              style:
                  Theme.of(
                    context,
                  ).textTheme.titleMedium!.copyWith(
                    color: ColorManager.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 8.h),
            CareProgramSection(),
            AdditionalProgramSection(),
            DefaultButton(
              icon: Icon(Icons.arrow_forward),
              label: 'اكمال تسجيل الحالة',
              onPressed: () {},
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
