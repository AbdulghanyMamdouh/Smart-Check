import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smart_check/core/theme/color_manager.dart';

class StatisticsItem extends StatelessWidget {
  const StatisticsItem({super.key, required this.branchName});
  final String branchName;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            branchName,
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(color: ColorManager.darkPrimary),
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 10),

          decoration: BoxDecoration(
            color: ColorManager.darkPrimary,
            boxShadow: [
              BoxShadow(
                blurStyle: BlurStyle.inner,
                color: Colors.red,
                blurRadius: 5,
                spreadRadius: 0,
                offset: Offset(-3, 4),
              ),
            ],
            borderRadius: BorderRadius.circular(16.r),

            border: Border.all(color: ColorManager.white, width: 2.w),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Number of Conditions: 15',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(color: ColorManager.white),
              ),
              SizedBox(height: 25.h),
              Text(
                'Total Price: 2500 EGP',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(color: ColorManager.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
