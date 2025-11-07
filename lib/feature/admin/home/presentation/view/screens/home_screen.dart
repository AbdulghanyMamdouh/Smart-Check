import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/core/widgets/easy_date_package.dart';
import 'package:smart_check/core/widgets/search_text_field.dart';
import 'package:smart_check/feature/admin/home/presentation/view/widget/condition_item.dart';
import 'package:smart_check/feature/admin/home/presentation/view/widget/custom_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    final branchName = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      // backgroundColor: ColorManager.blueGrey,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color.fromARGB(226, 55, 145, 228),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_month_outlined),
            iconSize: 40.sp,
            color: ColorManager.white,
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now().subtract(Duration(days: 120)),
                lastDate: DateTime.now(),
              );
            },
          ),
          SearchTextField(),
        ],
        title: Text(
          branchName,
          style: TextStyle(
            color: ColorManager.white,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            EasyDatePackage(
              onDateChange: (selectedDate) {},
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: 16.h),
              itemCount: 6,
              itemBuilder: (_, index) => ConditionItem(
                branchName: 'Damnhur',
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: customBottomNavigationBar(context: context),
    );
  }
}
