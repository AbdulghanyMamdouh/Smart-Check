import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/core/utils/custom_dialog.dart';
import 'package:smart_check/core/widgets/default_button.dart';
import 'package:smart_check/core/widgets/doctor_text_field_item.dart';
import 'package:smart_check/feature/doctor/home/presentation/view_model/doctor_home_state.dart';
import 'package:smart_check/feature/doctor/home/presentation/view_model/doctor_home_view_model.dart';

class UpdateExaminationBottomSheet extends StatelessWidget {
  const UpdateExaminationBottomSheet({
    super.key,
    required this.examinationId,
    required this.keyString,
    required this.value,
  });
  final int? examinationId;
  final String? keyString;
  final String? value;

  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<DoctorHomeViewModel>();
    viewModel.value = TextEditingController(text: value);
    viewModel.examinationId = examinationId;

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
              'Smart check App',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: ColorManager.darkPrimary,
              ),
            ),
            SizedBox(height: 16.h),
            DoctorTextFieldItem(
              controller: viewModel.value,
              labelText: 'تعديل الحاله',
            ),

            SizedBox(height: 16.h),

            BlocListener<DoctorHomeViewModel, DoctorHomeState>(
              bloc: viewModel,
              listener: (context, state) {
                if (state is HomeUpdateExaminationLoading) {
                  CustomDialog.showLoading(context);
                } else if (state is HomeUpdateExaminationError) {
                  CustomDialog.hideLoading(context);
                  CustomDialog.showMessage(state.errMsg);
                } else if (state is HomeUpdateExaminationIdError) {
                  CustomDialog.showMessage(state.errMsg);
                } else if (state is HomeUpdateExaminationSuccess) {
                  CustomDialog.hideLoading(context);
                  CustomDialog.showMessage(state.sucMsg);
                  Navigator.of(context).pop();
                }
              },
              child: DefaultButton(
                icon: Icon(Icons.arrow_forward),
                label: 'تحديث البيانات',
                onPressed: () {
                  viewModel.updateExamination();
                },
              ),
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
