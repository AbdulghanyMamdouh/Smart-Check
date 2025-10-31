import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';

class TabBodyItem extends StatelessWidget {
  const TabBodyItem({super.key, required this.branchName});
  final String branchName;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
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
            'Name: ahmed',
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(color: ColorManager.white),
          ),
          Text(
            'price: 250 EGP',
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(color: ColorManager.white),
          ),
          Text(
            branchName,
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(color: ColorManager.white),
          ),
        ],
      ),
    );
  }
}
