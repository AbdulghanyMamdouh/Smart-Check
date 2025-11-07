import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';
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
            EasyDateTimeLine(
              headerProps: EasyHeaderProps(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                selectedDateStyle: TextStyle(
                  color: ColorManager.primary,
                  fontSize: 20,
                ),
                monthStyle: TextStyle(
                  color: ColorManager.primary,
                  fontSize: 20,
                ),
              ),
              locale: "ar",
              initialDate: DateTime.now(),

              onDateChange: (selectedDate) {
                // provider.changeSelectedDate(
                //   selectedDate,
                //   authProvider.currentUser?.uId ?? '',
                // );
              },
              dayProps: EasyDayProps(
                inactiveDayStyle: DayStyle(
                  dayStrStyle: TextStyle(
                    color: ColorManager.black,
                    fontWeight: FontWeight.w700,
                  ),
                  monthStrStyle: TextStyle(
                    color: ColorManager.black,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorManager.primary,
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        ColorManager.primary,
                        ColorManager.white,
                      ],
                    ),
                  ),
                ),
                todayStyle: DayStyle(
                  monthStrStyle: TextStyle(
                    color: ColorManager.black,
                    fontWeight: FontWeight.w700,
                  ),
                  dayStrStyle: TextStyle(
                    color: ColorManager.black,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        ColorManager.blueGrey,
                        ColorManager.navy,
                      ],
                    ),
                  ),
                ),
                // todayHighlightColor: ColorManager.red,
                activeDayStyle: const DayStyle(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff3371FF),
                        Color(0xff8426D6),
                      ],
                    ),
                  ),
                ),
              ),
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
