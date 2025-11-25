import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/entity/examination_entity.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/core/utils/custom_dialog.dart';
import 'package:smart_check/core/widgets/care_info.dart';
import 'package:smart_check/core/widgets/chiken_info.dart';
import 'package:smart_check/core/widgets/client_personal_info.dart';
import 'package:smart_check/core/widgets/default_button.dart';
import 'package:smart_check/feature/doctor/home/presentation/view/widgets/additional_program_section.dart';
import 'package:smart_check/feature/doctor/home/presentation/view/widgets/care_program_section.dart';
import 'package:smart_check/feature/doctor/home/presentation/view_model/doctor_home_state.dart';
import 'package:smart_check/feature/doctor/home/presentation/view_model/doctor_home_view_model.dart';

class DoctorConditionDetailsScreen extends StatelessWidget {
  const DoctorConditionDetailsScreen({super.key});
  static const String routeName = 'doc_con_det';
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<DoctorHomeViewModel>();

    var examination =
        ModalRoute.of(context)?.settings.arguments as ExaminationEntity;
    return Scaffold(
      resizeToAvoidBottomInset: true,

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(226, 55, 145, 228),
        foregroundColor: ColorManager.white,

        title: Text(
          'تفاصيل الكشف',
          style: TextStyle(
            color: ColorManager.white,
          ),
        ),
      ),
      body: examination.isCompleted!
          ? Container(
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
                    ClientPersonalInfo(
                      examinationEntity: examination,
                    ),
                    ChikenInfo(
                      examinationEntity: examination,
                    ),
                    CareInfo(
                      examinationEntity: examination,
                    ),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
            )
          : Container(
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
                child: Form(
                  key: viewModel.formKey,
                  child: Column(
                    spacing: 20.h,
                    children: [
                      CareProgramSection(),
                      AdditionalProgramSection(),
                      BlocListener<DoctorHomeViewModel, DoctorHomeState>(
                        listener: (context, state) {
                          if (state is HomeCompleteExaminationLoading) {
                            CustomDialog.showLoading(context);
                          } else if (state is HomeCompleteExaminationError) {
                            CustomDialog.hideLoading(context);
                            CustomDialog.showMessage(state.errMsg);
                          } else if (state is HomeCompleteExaminationSuccess) {
                            CustomDialog.hideLoading(context);
                            CustomDialog.showMessage(state.sucMsg);
                            Navigator.of(context).pop();
                          }
                        },
                        child: DefaultButton(
                          icon: Icon(Icons.arrow_forward),
                          label: 'اكمال تسجيل الحالة',
                          onPressed: () {
                            viewModel.examinationId = examination.id;
                            viewModel.completeExamination();
                          },
                        ),
                      ),
                      SizedBox(height: 8.h),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
