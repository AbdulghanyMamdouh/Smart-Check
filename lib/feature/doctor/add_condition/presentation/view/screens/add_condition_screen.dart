import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/di/di.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/core/utils/custom_dialog.dart';
import 'package:smart_check/core/widgets/default_button.dart';
import 'package:smart_check/feature/doctor/add_condition/presentation/view/widgets/chiken_section.dart';
import 'package:smart_check/feature/doctor/add_condition/presentation/view/widgets/client_section.dart';
import 'package:smart_check/feature/doctor/add_condition/presentation/view_model/add_examination_states.dart';
import 'package:smart_check/feature/doctor/add_condition/presentation/view_model/add_examination_view_model.dart';

class AddConditionScreen extends StatelessWidget {
  const AddConditionScreen({super.key});
  static const String routeName = 'add_condition';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddExaminationViewModel(
        addExaminationUseCase: injectAddExaminationUseCase(),
      ),
      child: Builder(
        builder: (context) {
          final viewModel = context.read<AddExaminationViewModel>();
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              foregroundColor: ColorManager.white,
              title: Text(
                'تسجيل حالة جديدة',
                style: TextStyle(
                  color: ColorManager.white,
                ),
              ),
              centerTitle: true,
              backgroundColor: const Color.fromARGB(226, 55, 145, 228),
            ),
            body: SingleChildScrollView(
              child: Form(
                key: viewModel.formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    spacing: 8.h,

                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      ClientSection(),
                      SizedBox(
                        height: 20.h,
                      ),
                      ChikenSection(),

                      // CareProgramSection(),
                      // AdditionalProgramSection(),
                      // DefaultButton(
                      //   onPressed: () {},
                      //   label: 'اضغط لاضافة الحالة ',
                      //   icon: Icon(Icons.add),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(12.0),
              child:
                  BlocListener<AddExaminationViewModel, AddExaminationStates>(
                    bloc: viewModel,
                    listener: (context, state) {
                      if (state is AddExaminationLoading) {
                        CustomDialog.showLoading(context);
                      } else if (state is AddExaminationError) {
                        CustomDialog.hideLoading(context);
                        CustomDialog.showMessage(state.errMsg);
                      } else if (state is AddExaminationSuccess) {
                        CustomDialog.hideLoading(context);
                        CustomDialog.showMessage(state.sucMsg);
                      }
                    },
                    child: DefaultButton(
                      onPressed: () {
                        viewModel.addExamination();
                      },
                      label: 'اضغط لاضافة الحالة ',
                      icon: Icon(Icons.add),
                    ),
                  ),
            ),
          );
        },
      ),
    );
  }
}
