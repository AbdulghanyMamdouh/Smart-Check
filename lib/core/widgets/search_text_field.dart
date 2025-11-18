import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField({
    super.key,
    required this.onChanged,
  });
  void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 70.h,
      width: 105.w,
      child: TextField(
        maxLength: 5,
        onChanged: onChanged,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.white),
          ),
          hintText: 'الكود..؟',
          fillColor: ColorManager.white,
          hintStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
            color: ColorManager.white,
          ),
        ),
      ),
    );
  }
}
