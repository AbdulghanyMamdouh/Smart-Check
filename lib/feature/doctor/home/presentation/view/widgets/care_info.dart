import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/feature/doctor/home/presentation/view/widgets/information_care_item.dart';

class CareInfo extends StatelessWidget {
  const CareInfo({super.key});

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
        spacing: 8.h,
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
            labelText: 'التشريح',
            hintText:
                'hai eiejr owo whr rje ejejw wje jeen \n eidm eowm peptt cmmf,dos firrt doepe \nogjgpro jpogjg jlajg ,nghsl gur rmgbg',
          ),
          InformationCareItem(
            labelText: 'التشخيص',
            hintText:
                'hai eiejr owo whr rje ejejw wje jeen \n eidm eowm peptt cmmf,dos firrt doepe \nogjgpro jpogjg jlajg ,nghsl gur rmgbg',
          ),
          InformationCareItem(
            labelText: 'برنامج التحصين',
            hintText:
                'hai eiejr owo whr rje ejejw wje jeen \n eidm eowm peptt cmmf,dos firrt doepe \nogjgpro jpogjg jlajg ,nghsl gur rmgbg',
          ),
          InformationCareItem(
            labelText: 'المضاد الحيوي',
            hintText:
                'hai eiejr owo whr rje ejejw wje jeen \n eidm eowm peptt cmmf,dos firrt doepe \nogjgpro jpogjg jlajg ,nghsl gur rmgbg',
          ),
          InformationCareItem(
            labelText: 'البرنامج العلاجي',
            hintText:
                'hai eiejr owo whr rje ejejw wje jeen \n eidm eowm peptt cmmf,dos firrt doepe \nogjgpro jpogjg jlajg ,nghsl gur rmgbg',
          ),
        ],
      ),
    );
  }
}
