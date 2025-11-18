import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/core/utils/custom_dialog.dart';
import 'package:smart_check/core/utils/shared_preference_utils.dart';
import 'package:smart_check/core/utils/validator.dart';
import 'package:smart_check/core/widgets/default_button.dart';
import 'package:smart_check/core/widgets/default_text_field.dart';
import 'package:smart_check/feature/admin/home/presentation/view/screens/fragment_screen.dart';
import 'package:smart_check/feature/admin/home/presentation/view/screens/home_screen.dart';
import 'package:smart_check/feature/auth/presentation/view_model/auth_states.dart';
import 'package:smart_check/feature/auth/presentation/view_model/auth_view_model.dart';

class LoginAdminScreen extends StatelessWidget {
  const LoginAdminScreen({super.key});
  static const String routeName = 'login';
  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<AuthViewModel>();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200.h,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(226, 55, 145, 228),

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
          key: viewModel.adminFormKey,
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
                'تسجيل دخول مسؤول النظام',
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

              TextButton(
                onPressed: () {
                  viewModel.clearInputs();
                  Navigator.pushNamed(
                    context,
                    FragmentScreen.routeName,
                  ).then((_) => viewModel.clearInputs());
                },

                child: Container(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: ColorManager.textColor,
                        width: 1.0, // Underline thickness
                      ),
                    ),
                  ),
                  child: Text(
                    'لتسجيل الدخول كموظف اضغط هنا؟',
                    style: TextStyle(
                      color: ColorManager.primary,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
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
            if (state is AdminLoginLoading) {
              //todo: show loading
              CustomDialog.showLoading(context);
            } else if (state is AdminLoginSuccess) {
              //todo: hide loading

              CustomDialog.hideLoading(context);
              //todo: save token
              SharedPreferenceUtils.saveData(
                key: 'token',
                value: state.loginResult.token,
              );
              //todo: go to home
              Navigator.of(context).pushNamed(HomeScreen.routeName);
            } else if (state is AdminLoginError) {
              CustomDialog.hideLoading(context);
              CustomDialog.showMessage(state.errorMsg);
            }
          },
          child: DefaultButton(
            icon: Icon(Icons.arrow_forward),
            label: 'تسجيل الدخول',
            onPressed: () {
              viewModel.adminLogin();
            },
          ),
        ),
      ),
    );
  }
}
