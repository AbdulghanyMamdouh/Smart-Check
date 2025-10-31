import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/core/widgets/custom_app_bar.dart';
import 'package:smart_check/feature/admin/statistics/presentation/view/widgets/statistics_item.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({super.key});
  static const String routeName = 'static';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 25.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 44.sp,
                    color: ColorManager.darkPrimary,
                  ),
                ),
                CustomAppBar(title: 'Statics of Branches', width: 280.w),
              ],
            ),
            StatisticsItem(branchName: 'Damnhur'),
            StatisticsItem(branchName: 'Sadat'),
            StatisticsItem(branchName: 'Nubaria'),
            SizedBox(height: 16.h),
            Text(
              'Total condition:',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: ColorManager.darkPrimary,
              ),
            ),
            Text(
              'total price:',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: ColorManager.darkPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
