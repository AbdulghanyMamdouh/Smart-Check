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
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorManager.darkPrimary, width: 2.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name: ahmed'),
          Text('price: 250 EGP'),
          Text(branchName),
        ],
      ),
    );
  }
}
