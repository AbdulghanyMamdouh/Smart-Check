import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/core/widgets/default_button.dart';
import 'package:smart_check/core/widgets/default_text_field.dart';

class LoginEmpScreen extends StatelessWidget {
  const LoginEmpScreen({super.key});
  static const String routeName = 'login_emp';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              controller: TextEditingController(),
              label: 'ادخل اسم المستخدم',
            ),
            SizedBox(height: 20.h),
            DefaultTextField(
              controller: TextEditingController(),
              label: 'ادخل كلمة المرور',
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12.0.w,
          vertical: 16.h,
        ),
        child: DefaultButton(
          icon: Icon(Icons.arrow_forward),
          label: 'تسجيل الدخول',
          onPressed: () {},
        ),
      ),
    );
  }
}
