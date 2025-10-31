import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/core/widgets/custom_app_bar.dart';
import 'package:smart_check/core/widgets/default_button.dart';
import 'package:smart_check/core/widgets/default_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const String routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 90.h, left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(title: 'SmartCheck', width: 200.w),
            SizedBox(height: 100.h),
            Text(
              'Welcome to SmartCheck',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: ColorManager.darkPrimary,
              ),
            ),
            SizedBox(height: 25.h),
            DefaultTextField(
              controller: TextEditingController(),
              label: 'Enter Your Email Address',
            ),
            SizedBox(height: 50.h),
            DefaultTextField(
              controller: TextEditingController(),
              label: 'Enter Your Password',
            ),
            SizedBox(height: 50.h),
            DefaultButton(
              icon: Icon(Icons.arrow_forward),
              label: 'Login',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
