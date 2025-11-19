import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/core/utils/custom_dialog.dart';
import 'package:smart_check/core/utils/validator.dart';
import 'package:smart_check/core/widgets/default_button.dart';
import 'package:smart_check/core/widgets/default_text_field.dart';
import 'package:smart_check/feature/admin/manager/presentation/view/widgets/custom_menu.dart';
import 'package:smart_check/feature/admin/manager/presentation/view_model/manager_states.dart';
import 'package:smart_check/feature/admin/manager/presentation/view_model/manager_view_model.dart';

class AddEmployeeBottomSheet extends StatelessWidget {
  const AddEmployeeBottomSheet({super.key, required this.viewModel});
  final ManagerViewModel viewModel;
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
        child: Form(
          key: viewModel.formKey,
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
                controller: viewModel.userName,
                label: 'ادخل اسم الموظف',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'من فضلك ادخل اسم للموظف';
                  }
                  return null;
                },
              ),

              SizedBox(height: 16.h),
              DefaultTextField(
                controller: viewModel.password,
                label: 'ادخل كلمة المرور',
                validator: (value) {
                  if (!Validator.isPassowrd(value)) {
                    return 'من فضلك ادخل كلمة مرور للموظف';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8.h),

              CustomMenu(),
              SizedBox(height: 8.h),

              BlocListener<ManagerViewModel, ManagerStates>(
                bloc: viewModel,
                listener: (context, state) {
                  if (state is AddEmployeeLoading) {
                    //todo: show loading
                    CustomDialog.showLoading(context);
                  } else if (state is AddEmployeeSuccess) {
                    //todo: hide loading
                    //navigate to home
                    CustomDialog.hideLoading(context);
                    CustomDialog.showMessage(state.sucMsg);
                    Navigator.of(context).pop();
                  } else if (state is AddEmployeeError) {
                    CustomDialog.hideLoading(context);
                    CustomDialog.showMessage(state.errMsg);
                  } else if (state is AddEmployeeErrorBranchName) {
                    CustomDialog.showMessage(state.errMsg);
                  }
                },
                child: DefaultButton(
                  icon: Icon(Icons.arrow_forward),
                  label: 'إضافة الموظف',
                  onPressed: () {
                    viewModel.addEmployee();
                  },
                ),
              ),
              SizedBox(height: 8.h),
            ],
          ),
        ),
      ),
    );
  }
}
