import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/feature/doctor/add_condition/presentation/view/widgets/doctor_text_field_item.dart';

class CareProgramSection extends StatelessWidget {
  const CareProgramSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
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
        // color: Colors.white,
      ),
      child: Column(
        spacing: 8.h,
        children: [
          Row(
            spacing: 4.w,
            children: [
              Icon(
                Icons.local_hospital_outlined,
                size: 32.sp,
              ),
              Text(
                'البرنامج العلاجي',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            spacing: 8.w,
            children: [
              Flexible(
                child: DoctorTextFieldItem(
                  labelText: 'آخر مضاد حيوي',
                  controller: TextEditingController(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Flexible(
                child: DoctorTextFieldItem(
                  labelText: 'برنامج التحصين',
                  controller: TextEditingController(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
