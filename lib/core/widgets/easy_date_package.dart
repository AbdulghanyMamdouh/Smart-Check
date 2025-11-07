import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

import 'package:smart_check/core/theme/color_manager.dart';

class EasyDatePackage extends StatelessWidget {
  const EasyDatePackage({
    super.key,
    required this.onDateChange,
  });
  final void Function(DateTime)? onDateChange;
  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
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

      onDateChange: onDateChange,
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
    );
  }
}
