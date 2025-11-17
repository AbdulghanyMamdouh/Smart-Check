import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/feature/admin/home/domain/entity/examination_entity.dart';
import 'package:smart_check/core/widgets/information_care_item.dart';
import 'package:smart_check/core/widgets/update_examination_bottom_sheet.dart';

// ignore: must_be_immutable
class CareInfo extends StatelessWidget {
  CareInfo({super.key, required this.examinationEntity});
  ExaminationEntity examinationEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        // color: Colors.white,
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 192, 247, 247),
            Colors.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(12.r),
        // border: Border.all(
        //   width: 2.w,
        //   color: ColorManager.darkPrimary,
        // ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.h,
        children: [
          Row(
            spacing: 4.w,
            children: [
              Icon(
                Icons.cases_rounded,
                size: 32.sp,
              ),
              Text(
                'معلومات القطيع الطبية',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          InformationCareItem(
            labelText: 'الشكوي',
            hintText: examinationEntity.compliant.toString(),
            onLongPress: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => UpdateExaminationBottomSheet(
                  examinationId: examinationEntity.id ?? 2,
                  keyString: 'compliant',
                  value:
                      examinationEntity.compliant ??
                      ' eiejr owo whr rje ejejw wje jeen \n hai eiejr owo whr rje ejejw wje jeen \n hai eiejr owo whr rje ejejw wje jeen \n hai eiejr owo whr rje ejejw wje jeen \n hai eiejr owo whr rje ejejw wje jeen \n hai eiejr owo whr rje ejejw wje jeen \n hai eiejr owo whr rje ejejw wje jeen',
                ),
              );
            },
          ),
          InformationCareItem(
            labelText: 'التشريح',
            hintText:
                examinationEntity.anatomy ??
                'hai eiejr owo whr rje ejejw wje jeen \n eidm eowm peptt cmmf,dos firrt doepe \nogjgpro jpogjg jlajg ,nghsl gur rmgbg',
            onLongPress: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => UpdateExaminationBottomSheet(
                  examinationId: examinationEntity.id,
                  keyString: 'anatomy',
                  value:
                      examinationEntity.anatomy ??
                      'hai eiejr owo whr rje ejejw wje jeen',
                ),
              );
            },
          ),
          InformationCareItem(
            labelText: 'التشخيص',
            hintText:
                examinationEntity.diagnosis ??
                'hai eiejr owo whr rje ejejw wje jeen \n eidm eowm peptt cmmf,dos firrt doepe \nogjgpro jpogjg jlajg ,nghsl gur rmgbg',
            onLongPress: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => UpdateExaminationBottomSheet(
                  examinationId: examinationEntity.id,
                  keyString: 'diagnosis',
                  value:
                      examinationEntity.diagnosis ??
                      'hai eiejr owo whr rje ejejw wje jeen',
                ),
              );
            },
          ),
          InformationCareItem(
            labelText: 'برنامج التحصين',
            hintText:
                examinationEntity.immunisationProgram ??
                'hai eiejr owo whr rje ejejw wje jeen \n eidm eowm peptt cmmf,dos firrt doepe \nogjgpro jpogjg jlajg ,nghsl gur rmgbg',
            onLongPress: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => UpdateExaminationBottomSheet(
                  examinationId: examinationEntity.id,
                  keyString: 'immunisationProgram',
                  value:
                      examinationEntity.immunisationProgram ??
                      'hai eiejr owo whr rje ejejw wje jeen',
                ),
              );
            },
          ),
          InformationCareItem(
            labelText: 'المضاد الحيوي',
            hintText:
                examinationEntity.lastAntibiotic ??
                'hai eiejr owo whr rje ejejw wje jeen \n eidm eowm peptt cmmf,dos firrt doepe \nogjgpro jpogjg jlajg ,nghsl gur rmgbg',
            onLongPress: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => UpdateExaminationBottomSheet(
                  examinationId: examinationEntity.id,
                  keyString: 'lastAntibiotic',
                  value:
                      examinationEntity.lastAntibiotic ??
                      'hai eiejr owo whr rje ejejw wje jeen',
                ),
              );
            },
          ),
          InformationCareItem(
            labelText: 'البرنامج العلاجي',
            hintText:
                examinationEntity.treatment ??
                'hai eiejr owo whr rje ejejw wje jeen \n eidm eowm peptt cmmf,dos firrt doepe \nogjgpro jpogjg jlajg ,nghsl gur rmgbg',
            onLongPress: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => UpdateExaminationBottomSheet(
                  examinationId: examinationEntity.id,
                  keyString: 'treatment',
                  value:
                      examinationEntity.treatment ??
                      'hai eiejr owo whr rje ejejw wje jeen',
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
