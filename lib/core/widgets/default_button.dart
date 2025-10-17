import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';

class DefaultButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final Icon icon;

  const DefaultButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: SizedBox(
        width: 200.w,
        child: Text(
          label,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: ColorManager.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.start,
        ),
      ),
      icon: SizedBox(width: 60.w, child: icon),
      style: ElevatedButton.styleFrom(
        iconColor: ColorManager.white,
        iconSize: 28.sp,
        backgroundColor: ColorManager.darkPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        // minimumSize: Size(270.w, 50.h),
        fixedSize: Size(3100.w, 70.h),
      ),
      iconAlignment: IconAlignment.end,
    );
  }
}
