import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smart_check/core/theme/color_manager.dart';

class DoctorTextFieldItem extends StatelessWidget {
  const DoctorTextFieldItem({
    super.key,
    required this.labelText,
    this.validator,
    required this.controller,
  });
  final String labelText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 100.h,
      // width: 100,
      child: TextFormField(
        style: TextStyle(
          color: ColorManager.black,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
        validator: validator,
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.newline,
        controller: controller,
        maxLines: 5,
        minLines: 1,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(4),
          labelText: labelText,

          labelStyle: TextStyle(
            color: ColorManager.black,
            fontSize: 18.sp,
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
              color: ColorManager.black,
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
