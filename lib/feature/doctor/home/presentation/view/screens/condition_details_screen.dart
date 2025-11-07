import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/core/widgets/default_button.dart';
import 'package:smart_check/feature/doctor/add_condition/presentation/view/widgets/additional_program_section.dart';
import 'package:smart_check/feature/doctor/add_condition/presentation/view/widgets/care_program_section.dart';
import 'package:smart_check/feature/doctor/home/presentation/view/widgets/chiken_info.dart';

class ConditionDetailsScreen extends StatelessWidget {
  const ConditionDetailsScreen({super.key});
  static const String routeName = 'con_det';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(226, 55, 145, 228),
        foregroundColor: ColorManager.white,
        title: Row(
          spacing: 8.w,
          children: [
            Text(
              'امين صبري عفيفي',
              style: TextStyle(
                color: ColorManager.white,
              ),
            ),
            Text(
              '23',
              style: TextStyle(
                color: ColorManager.darkPrimary,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,

        padding: EdgeInsets.all(8.w),
        margin: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          // color: Colors.white,
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 192, 247, 247),
              Colors.white,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            width: 2.w,
            color: ColorManager.darkPrimary,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10.h,
            children: [
              ChikenInfo(),
              // SizedBox(
              //   height: 10.h,
              // ),
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
      ),
    );
  }
}
