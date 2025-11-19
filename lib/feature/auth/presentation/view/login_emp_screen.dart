import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/di/di.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/core/utils/custom_dialog.dart';
import 'package:smart_check/core/utils/shared_preference_utils.dart';
import 'package:smart_check/core/utils/validator.dart';
import 'package:smart_check/core/widgets/default_button.dart';
import 'package:smart_check/core/widgets/default_text_field.dart';
import 'package:smart_check/feature/auth/presentation/view_model/auth_states.dart';
import 'package:smart_check/feature/auth/presentation/view_model/auth_view_model.dart';
import 'package:smart_check/feature/doctor/home/presentation/view/screens/doctor_home_screen.dart';

class LoginEmpScreen extends StatelessWidget {
  LoginEmpScreen({super.key});
  static const String routeName = 'login_emp';
  final String branchName = '';
  final viewModel = AuthViewModel(loginUseCase: injectLoginUseCase());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      appBar: AppBar(
        toolbarHeight: 200.h,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(226, 55, 145, 228),
        foregroundColor: ColorManager.white,

        title: Text(
          'SmartCheck',
          style: TextStyle(
            color: ColorManager.white,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: Form(
          key: viewModel.employeeFormKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.h),
                Text(
                  'Welcome to SmartCheck',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: ColorManager.darkPrimary,
                  ),
                ),
                Text(
                  'تسجيل دخول موظف النظام',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: ColorManager.primary,
                  ),
                ),
                SizedBox(height: 25.h),
                DefaultTextField(
                  controller: viewModel.userNameController,
                  label: 'ادخل اسم المستخدم',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'invalid user name!.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                DefaultTextField(
                  isPassword: true,
                  validator: (value) {
                    if (!Validator.isPassowrd(value)) {
                      return 'invalid password!.';
                    }
                    return null;
                  },
                  controller: viewModel.passwordController,
                  label: 'ادخل كلمة المرور',
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12.0.w,
          vertical: 16.h,
        ),
        child: BlocListener<AuthViewModel, AuthState>(
          bloc: viewModel,
          listener: (context, state) {
            if (state is EmployeeLoginLoading) {
              //todo: show loading
              CustomDialog.showLoading(context);
            } else if (state is EmployeeLoginSuccess) {
              //todo: hide loading

              CustomDialog.hideLoading(context);
              //todo: save token
              SharedPreferenceUtils.saveData(
                key: 'token',
                value: state.loginResult.token,
              );
              SharedPreferenceUtils.saveData(
                key: 'login',
                value: 'emp',
              );
              SharedPreferenceUtils.saveData(
                key: 'branch',
                value: state.loginResult.user!.branchName,
              );
              //todo: go to home

              Navigator.of(context).pushNamed(
                DoctorHomeScreen.routeName,
              );
            } else if (state is EmployeeLoginError) {
              CustomDialog.hideLoading(context);
              CustomDialog.showMessage(state.errorMsg);
            }
          },
          child: DefaultButton(
            icon: Icon(Icons.arrow_forward),
            label: 'تسجيل الدخول',
            onPressed: () {
              viewModel.employeeLogin();
            },
          ),
        ),
      ),
    );
  }
}
