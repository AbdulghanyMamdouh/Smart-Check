import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/feature/admin/home/domain/entity/examination_entity.dart';
import 'package:smart_check/feature/doctor/home/presentation/view/widgets/information_chiken_item.dart';

// ignore: must_be_immutable
class ChikenInfo extends StatelessWidget {
  ChikenInfo({super.key, required this.examinationEntity});
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
          begin: Alignment.bottomLeft,
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
                'معلومات القطيع',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            spacing: 6.w,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: InformationChikenItem(
                  labelText: 'السلالة',
                  hintText: examinationEntity.herdType ?? 'hes23',
                ),
              ),
              Expanded(
                child: InformationChikenItem(
                  labelText: 'العدد',
                  hintText: '${examinationEntity.herdCount ?? 88}',
                ),
              ),
              Flexible(
                child: InformationChikenItem(
                  labelText: 'النافق',
                  hintText: '${examinationEntity.herdDied ?? 21}',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            spacing: 6.w,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: InformationChikenItem(
                  labelText: 'العلف',
                  hintText: '${examinationEntity.herdFeedPerDay ?? 32}',
                ),
              ),
              Expanded(
                child: InformationChikenItem(
                  labelText: 'المياه',
                  hintText: '${examinationEntity.herdWaterPerDay ?? 45}',
                ),
              ),
              Flexible(
                child: InformationChikenItem(
                  labelText: 'العمر',
                  hintText: '${examinationEntity.herdAgeInDays ?? 21}',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
