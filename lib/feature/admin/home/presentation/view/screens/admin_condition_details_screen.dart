import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/core/entity/examination_entity.dart';
import 'package:smart_check/core/widgets/care_info.dart';
import 'package:smart_check/core/widgets/chiken_info.dart';
import 'package:smart_check/core/widgets/client_personal_info.dart';

class AdminConditionDetailsScreen extends StatelessWidget {
  const AdminConditionDetailsScreen({super.key});
  static const String routeName = 'admin_con_det';
  @override
  Widget build(BuildContext context) {
    var examination =
        ModalRoute.of(context)?.settings.arguments as ExaminationEntity;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(226, 55, 145, 228),
        foregroundColor: ColorManager.white,
        title: Row(
          spacing: 8.w,
          children: [
            Text(
              examination.branchName ?? 'null',
              style: TextStyle(
                color: ColorManager.darkPrimary,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,

        padding: EdgeInsets.all(8.w),
        margin: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          // color: Colors.white,
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 192, 247, 247),
              Colors.white,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            width: 2.w,
            color: ColorManager.darkPrimary,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10.h,
            children: [
              ClientPersonalInfo(
                examinationEntity: examination,
              ),
              ChikenInfo(
                examinationEntity: examination,
              ),
              examination.isCompleted ?? false
                  ? CareInfo(
                      examinationEntity: examination,
                    )
                  : SizedBox(height: 8.h),
            ],
          ),
        ),
      ),
    );
  }
}
