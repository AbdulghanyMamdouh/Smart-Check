import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';

class NavBarIcon extends StatelessWidget {
  const NavBarIcon({super.key, required this.icon, required this.isSelected});

  final IconData icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? ColorManager.primary : Colors.transparent,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(8),
      child: Icon(
        icon,
        size: 42.sp,

        color: ColorManager.white,
      ),
    );
  }
}
