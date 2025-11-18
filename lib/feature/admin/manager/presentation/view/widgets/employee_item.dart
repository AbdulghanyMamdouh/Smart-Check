import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/feature/admin/manager/domain/entity/employee_entity.dart';

class EmployeeItem extends StatelessWidget {
  const EmployeeItem({super.key, required this.employeeEntity});

  final EmployeeEntity employeeEntity;
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
              Text(employeeEntity.username ?? ''),
              //todo: branch name
              Text(employeeEntity.branch ?? "null"),
            ],
          ),
        ],
      ),
    );
  }
}
