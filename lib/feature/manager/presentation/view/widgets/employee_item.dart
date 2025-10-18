import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';

class EmployeeItem extends StatelessWidget {
  const EmployeeItem({super.key, required this.branchName});
  final String branchName;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 10),

      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 2,
            spreadRadius: 0,
            offset: Offset(1, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(16.r),
        // border: Border.all(color: ColorManager.darkPrimary, width: 2.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //todo: employee name
              Text('Name: ahmed'),
              //todo: branch name
              Text(branchName),
            ],
          ),
          IconButton(
            onPressed: () {},
            color: ColorManager.primary,
            icon: Icon(Icons.delete_forever_outlined),
          ),
        ],
      ),
    );
  }
}
