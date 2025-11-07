import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/core/widgets/easy_date_package.dart';
import 'package:smart_check/core/widgets/search_text_field.dart';
import 'package:smart_check/feature/doctor/add_condition/presentation/view/screens/add_condition_screen.dart';
import 'package:smart_check/feature/doctor/home/presentation/view/widgets/condition_item.dart';

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({super.key});
  static const String routeName = 'doctor_home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddConditionScreen.routeName);
        },
        backgroundColor: ColorManager.darkPrimary,
        child: Icon(
          Icons.add,
          size: 30.sp,
          color: ColorManager.white,
        ),
      ),
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
          'الحالات المسجلة',
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
    );
  }
}
