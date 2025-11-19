import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/core/utils/validator.dart';
import 'package:smart_check/feature/doctor/add_condition/presentation/view/widgets/client_text_field_item.dart';
import 'package:smart_check/feature/doctor/add_condition/presentation/view_model/add_examination_view_model.dart';

class ClientSection extends StatelessWidget {
  const ClientSection({
    super.key,
    required this.viewModel,
  });
  final AddExaminationViewModel viewModel;

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
        border: Border.all(
          width: 2.w,
          color: ColorManager.darkPrimary,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8.h,
        children: [
          Row(
            children: [
              Icon(
                Icons.person_4_outlined,
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
                child: ClientTextFieldItem(
                  labelText: 'اسم العميل',
                  controller: viewModel.clientName,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'من فضلك ادخل اسم العميل';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(
                child: ClientTextFieldItem(
                  labelText: ' رقم الهاتف',
                  controller: viewModel.clientPhone,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (!Validator.isPhoneEg(value)) {
                      return 'يقبل فقط الارقام المصرية';
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
            spacing: 6,
            children: [
              Flexible(
                flex: 5,
                child: ClientTextFieldItem(
                  labelText: 'العنوان',
                  controller: viewModel.clientAddress,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'من فضلك ادخل العنوان';
                    }
                    return null;
                  },
                ),
              ),
              Flexible(
                flex: 3,
                child: ClientTextFieldItem(
                  labelText: 'كود العميل',
                  keyboardType: TextInputType.number,
                  controller: viewModel.clientCode,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'من فضلك ادخل كود العميل';
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
