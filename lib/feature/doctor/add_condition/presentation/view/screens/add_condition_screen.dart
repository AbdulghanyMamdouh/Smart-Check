import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/core/widgets/default_button.dart';
import 'package:smart_check/feature/doctor/add_condition/presentation/view/widgets/additional_program_section.dart';
import 'package:smart_check/feature/doctor/add_condition/presentation/view/widgets/care_program_section.dart';
import 'package:smart_check/feature/doctor/add_condition/presentation/view/widgets/chiken_section.dart';
import 'package:smart_check/feature/doctor/add_condition/presentation/view/widgets/client_section.dart';

class AddConditionScreen extends StatelessWidget {
  const AddConditionScreen({super.key});
  static const String routeName = 'add_condition';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'تسجيل حالة جديدة',
          style: TextStyle(
            color: ColorManager.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(226, 55, 145, 228),
      ),
      body: Form(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 8.h,
                children: [
                  ClientSection(),

                  ChikenSection(),
                  CareProgramSection(),
                  AdditionalProgramSection(),

                  DefaultButton(
                    onPressed: () {},
                    label: 'اضغط لاضافة الحالة ',
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
