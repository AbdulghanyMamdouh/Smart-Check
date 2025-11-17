import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smart_check/core/theme/color_manager.dart';

class InformationChikenItem extends StatelessWidget {
  const InformationChikenItem({
    super.key,
    required this.labelText,
    required this.hintText,
  });
  final String labelText;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        spacing: 4.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            height: 50.h,
            width: double.infinity,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorManager.greyColor,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Text(
              hintText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
