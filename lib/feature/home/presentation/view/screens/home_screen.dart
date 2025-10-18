import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/core/widgets/custom_app_bar.dart';
import 'package:smart_check/core/widgets/search_text_field.dart';
import 'package:smart_check/feature/home/presentation/view/widget/custom_tab.dart';
import 'package:smart_check/feature/manager/presentation/view/screens/manager_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 25.h),
        child: Column(
          children: [
            Row(
              children: [
                CustomAppBar(title: 'Home', width: 150.w),
                SearchTextField(),
                IconButton(
                  icon: Icon(Icons.calendar_month_outlined),
                  iconSize: 40.sp,
                  color: ColorManager.darkPrimary,
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now().subtract(Duration(days: 120)),
                      lastDate: DateTime.now(),
                    );
                  },
                ),
              ],
            ),
            Expanded(child: CustomTab()),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: ColorManager.darkPrimary,

          borderRadius: BorderRadius.circular(46.r),
        ),
        child: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(ManagerScreen.routeName);
          },
          icon: Icon(
            Icons.manage_accounts,
            size: 52.sp,
            color: ColorManager.primary,
          ),
        ),
      ),
    );
  }
}
