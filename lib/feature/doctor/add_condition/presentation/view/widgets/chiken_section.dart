import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/feature/doctor/add_condition/presentation/view/widgets/client_text_field_item.dart';

class ChikenSection extends StatelessWidget {
  const ChikenSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 192, 247, 247),
            Colors.white,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        // color: Colors.white70,
        border: Border.all(width: 2.w, color: ColorManager.darkPrimary),
        borderRadius: BorderRadius.circular(12.r),
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
                child: ClientTextFieldItem(
                  labelText: 'النوع',
                  controller: TextEditingController(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(
                child: ClientTextFieldItem(
                  labelText: 'العمر بالايام',
                  controller: TextEditingController(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Flexible(
                child: ClientTextFieldItem(
                  labelText: 'العدد',
                  controller: TextEditingController(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
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
                child: ClientTextFieldItem(
                  labelText: 'العلف',
                  controller: TextEditingController(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(
                child: ClientTextFieldItem(
                  labelText: 'المياه',
                  controller: TextEditingController(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Flexible(
                child: ClientTextFieldItem(
                  labelText: 'النافق',
                  controller: TextEditingController(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
