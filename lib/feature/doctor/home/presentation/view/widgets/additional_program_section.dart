import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/feature/doctor/add_condition/presentation/view/widgets/doctor_text_field_item.dart';
import 'package:smart_check/feature/doctor/home/presentation/view_model/doctor_home_view_model.dart';

class AdditionalProgramSection extends StatelessWidget {
  const AdditionalProgramSection({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<DoctorHomeViewModel>();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        // color: Colors.white12,
        border: Border.all(
          width: 2.w,
          color: ColorManager.darkPrimary,
        ),
        borderRadius: BorderRadius.circular(12.r),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 192, 247, 247),
            Colors.white,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topRight,
        ),
      ),
      child: Column(
        spacing: 8.h,
        children: [
          Row(
            spacing: 4.w,
            children: [
              Icon(
                Icons.medical_information_outlined,
                size: 32.sp,
              ),
              Text(
                'تفاصيل القطيع الطبية',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          DoctorTextFieldItem(
            labelText: 'التشريح',
            controller: viewModel.anatomy,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          DoctorTextFieldItem(
            labelText: 'التشخيص',
            controller: viewModel.diagnosis,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          DoctorTextFieldItem(
            labelText: 'البرنامج العلاجي',
            controller: viewModel.treatment,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
