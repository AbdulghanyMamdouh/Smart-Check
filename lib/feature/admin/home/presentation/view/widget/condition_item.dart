import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/feature/admin/home/domain/entity/examination_entity.dart';
import 'package:smart_check/feature/admin/home/presentation/view/screens/admin_condition_details_screen.dart';

class ConditionItem extends StatelessWidget {
  const ConditionItem({super.key, required this.examinationEntity});
  final ExaminationEntity examinationEntity;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.of(
            context,
          ).pushNamed(
            AdminConditionDetailsScreen.routeName,
            arguments: examinationEntity,
          ),
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 10),

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 192, 247, 247),
              Colors.white,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topRight,
          ),
          boxShadow: [
            BoxShadow(
              blurStyle: BlurStyle.inner,
              color: examinationEntity.isCompleted ?? false
                  ? Colors.blue
                  : ColorManager.red,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'امين صبري عفيفي',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium!.copyWith(color: ColorManager.black),
                ),
                Text(
                  'الوفائية البحيرة',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium!.copyWith(color: ColorManager.black),
                ),
              ],
            ),

            Text(
              """
    
    التشخيص او شي مميز 
    
    طويل ومرن (حوالي 14 فقرة).
    بيسمح للطائر بالحركة في جميع الاتجاهات.
    بيوصل بين الرأس والجذع، ويمر فيه المريء (esophagus) والقصبة الهوائية (trachea).""",
              style: Theme.of(
                context,
              ).textTheme.titleMedium!.copyWith(color: ColorManager.black),
            ),
          ],
        ),
      ),
    );
  }
}
