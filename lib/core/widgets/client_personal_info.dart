import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/entity/examination_entity.dart';
import 'package:smart_check/core/widgets/information_chiken_item.dart';

// ignore: must_be_immutable
class ClientPersonalInfo extends StatelessWidget {
  ClientPersonalInfo({super.key, required this.examinationEntity});
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
                Icons.person_3_outlined,
                size: 32.sp,
              ),
              Text(
                'معلومات العميل',
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
                  labelText: 'اسم العميل ',
                  hintText: examinationEntity.clientName ?? 'null',
                ),
              ),
              Flexible(
                child: InformationChikenItem(
                  labelText: 'كود العميل',
                  hintText: examinationEntity.clientCode ?? 'null',
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
                  labelText: 'العنوان ',
                  hintText: examinationEntity.clientAddress ?? 'null',
                ),
              ),
              Expanded(
                child: InformationChikenItem(
                  labelText: 'رقم الهاتف',
                  hintText: examinationEntity.clientPhone ?? 'null',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
