import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/feature/admin/home/presentation/view/widget/nav_bar_icon.dart';
import 'package:smart_check/feature/admin/manager/presentation/view/screens/manager_screen.dart';
import 'package:smart_check/feature/admin/statistics/presentation/view/screens/statistic_screen.dart';

Widget customBottomNavigationBar({required BuildContext context}) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(15.r),
      topRight: Radius.circular(15.r),
    ),
    child: Theme(
      data: Theme.of(context).copyWith(
        shadowColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        backgroundColor: ColorManager.darkPrimary,

        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).pushNamed(ManagerScreen.routeName);
          } else if (index == 2) {
            Navigator.of(context).pushNamed(StatisticScreen.routeName);
          }
        },
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(
            icon: NavBarIcon(icon: Icons.manage_accounts, isSelected: false),

            label: '',
          ),
          BottomNavigationBarItem(
            icon: NavBarIcon(icon: Icons.home_outlined, isSelected: true),

            label: '',
          ),
          BottomNavigationBarItem(
            label: '',

            icon: NavBarIcon(
              icon: Icons.medical_information_rounded,
              isSelected: false,
            ),
          ),
        ],
      ),
    ),
  );
}
