import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smart_check/core/theme/color_manager.dart';

class ClientTextFieldItem extends StatelessWidget {
  const ClientTextFieldItem({
    super.key,
    required this.labelText,
    required this.validator,
    this.keyboardType = TextInputType.text,
    required this.controller,
  });
  final String labelText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 60.h,
      child: TextFormField(
        keyboardType: keyboardType,
        autovalidateMode: AutovalidateMode.disabled,
        style: TextStyle(
          color: ColorManager.black,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(4),
          labelText: labelText,

          labelStyle: TextStyle(
            color: ColorManager.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.r),
            ),
            borderSide: BorderSide(
              color: ColorManager.darkPrimary,
              width: 2.w,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.r),
            ),
            borderSide: BorderSide(
              color: ColorManager.blueGrey,
              width: 2.w,
            ),
          ),
          disabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.r),
            ),
            borderSide: BorderSide(
              color: ColorManager.black,
              width: 2.w,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.r),
            ),
            borderSide: BorderSide(
              color: ColorManager.black,
              width: 1.w,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.r),
            ),
            gapPadding: 8.h,
            borderSide: BorderSide(
              color: ColorManager.red,
              width: 2.w,
            ),
          ),
        ),
      ),
    );
  }
}
