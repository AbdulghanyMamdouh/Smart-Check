import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/feature/doctor/home/presentation/view/widgets/information_chiken_item.dart';

class ChikenInfo extends StatelessWidget {
  const ChikenInfo({super.key});

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
                  hintText: 'hes23',
                ),
              ),
              Expanded(
                child: InformationChikenItem(
                  labelText: 'العدد',
                  hintText: '2500',
                ),
              ),
              Flexible(
                child: InformationChikenItem(
                  labelText: 'النافق',
                  hintText: '23',
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
                  hintText: '45',
                ),
              ),
              Expanded(
                child: InformationChikenItem(
                  labelText: 'المياه',
                  hintText: '220',
                ),
              ),
              Flexible(
                child: InformationChikenItem(
                  labelText: 'العمر',
                  hintText: '15',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
