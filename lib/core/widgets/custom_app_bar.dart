import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.w,
      child: Stack(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          SizedBox(
            width: 100,
            height: 100,
            child: Image.asset('assets/images/icon1.png', fit: BoxFit.fill),
          ),

          Positioned(
            left: 80.w,
            top: 50.h,

            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: ColorManager.darkPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
