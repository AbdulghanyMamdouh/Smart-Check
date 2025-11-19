import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/entity/examination_entity.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/core/utils/custom_dialog.dart';
import 'package:smart_check/core/widgets/default_button.dart';
import 'package:smart_check/core/widgets/doctor_text_field_item.dart';
import 'package:smart_check/feature/doctor/home/domain/entity/complete_examination_request_entity.dart';
import 'package:smart_check/feature/doctor/home/presentation/view_model/doctor_home_state.dart';
import 'package:smart_check/feature/doctor/home/presentation/view_model/doctor_home_view_model.dart';

class UpdateExaminationBottomSheet extends StatelessWidget {
  UpdateExaminationBottomSheet({
    super.key,

    required this.keyString,
    required this.value,
    required this.examinationEntity,
  });

  final String? keyString;
  final String? value;
  ExaminationEntity examinationEntity;

  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<DoctorHomeViewModel>();
    var valueController = TextEditingController(text: value);
    viewModel.examinationId = examinationEntity.id ?? 1;

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
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
              controller: valueController,
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
                  // clone existing entity
                  final updatedExamination = CompleteExaminationRequestEntity(
                    anatomy: examinationEntity.anatomy,
                    immunisationProgram: examinationEntity.immunisationProgram,
                    lastAntibiotic: examinationEntity.lastAntibiotic,
                    diagnosis: examinationEntity.diagnosis,
                    treatment: examinationEntity.treatment,
                    examinationId: examinationEntity.id,
                  );

                  // تحديث الحقل المطلوب فقط
                  switch (keyString) {
                    case "lastAntibiotic":
                      updatedExamination.lastAntibiotic = valueController.text;
                      break;
                    case "immunisationProgram":
                      updatedExamination.immunisationProgram =
                          valueController.text;
                      break;
                    case "anatomy":
                      updatedExamination.anatomy = valueController.text;
                      break;
                    case "diagnosis":
                      updatedExamination.diagnosis = valueController.text;
                      break;
                    case "treatment":
                      updatedExamination.treatment = valueController.text;
                      break;
                    default:
                      return;
                  }

                  viewModel.updateExamination(examination: updatedExamination);
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
