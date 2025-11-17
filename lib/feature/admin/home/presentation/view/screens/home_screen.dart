import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/core/widgets/easy_date_package.dart';
import 'package:smart_check/core/widgets/search_text_field.dart';
import 'package:smart_check/feature/admin/home/domain/entity/examination_entity.dart';
import 'package:smart_check/feature/admin/home/presentation/view/widget/condition_item.dart';
import 'package:smart_check/feature/admin/home/presentation/view/widget/custom_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    final branchName = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      // backgroundColor: ColorManager.blueGrey,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color.fromARGB(226, 55, 145, 228),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_month_outlined),
            iconSize: 40.sp,
            color: ColorManager.white,
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now().subtract(Duration(days: 120)),
                lastDate: DateTime.now(),
              );
            },
          ),
          SearchTextField(),
        ],
        title: Text(
          branchName,
          style: TextStyle(
            color: ColorManager.white,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            EasyDatePackage(
              onDateChange: (selectedDate) {},
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: 16.h),
              itemCount: 6,
              itemBuilder: (_, index) => ConditionItem(
                examinationEntity: ExaminationEntity(
                  id: 2,
                  branchName: 'dam',
                  clientName: 'ali',
                  clientCode: '222',
                  employeeUsername: 'alia',
                  isCompleted: true,
                  compliant:
                      'mnbvxedsfdgfhgjhkjlkm\nmshd fhwkdod edyid wsjsk eypwte dow swoskd \n ghowo ueosadwde uua ayuq eerw siofhk fhf\njjjeosalxv l;v kl;dsl nflkx kdx\nis fhsklk',
                  diagnosis:
                      'mnbvxedsfdgfhgjhkjlkm\nmshd fhwkdod edyid wsjsk eypwte dow swoskd \n ghowo ueosadwde uua ayuq eerw siofhk fhf\njjjeosalxv l;v kl;dsl nflkx kdx\nis fhsklk',
                  clientAddress: 'wafaeya',
                  clientPhone: '01123735282',
                  herdAgeInDays: 23,
                  herdCount: 2234,
                  herdDied: 32,
                  herdFeedPerDay: 34,
                  herdWaterPerDay: 23,
                  herdType: 'dsk3',
                  lastAntibiotic:
                      'kdkjsl sal;d sjkd hk ksdakhs dklsdjkdf kljfd\nieifp e[pe fopf]pfkf e;opcce\n hhe ehpw p[wpwe]',
                  treatment:
                      'mnbvxedsfdgfhgjhkjlkm\nmshd fhwkdod edyid wsjsk eypwte dow swoskd \n ghowo ueosadwde uua ayuq eerw siofhk fhf\njjjeosalxv l;v kl;dsl nflkx kdx\nis fhsklk',

                  immunisationProgram:
                      'mnbvxedsfdgfhgjhkjlkm\nmshd fhwkdod edyid wsjsk eypwte dow swoskd \n ghowo ueosadwde uua ayuq eerw siofhk fhf\njjjeosalxv l;v kl;dsl nflkx kdx\nis fhsklk',

                  anatomy:
                      'mnbvxedsfdgfhgjhkjlkm\nmshd fhwkdod edyid wsjsk eypwte dow swoskd \n ghowo ueosadwde uua ayuq eerw siofhk fhf\njjjeosalxv l;v kl;dsl nflkx kdx\nis fhsklk',
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: customBottomNavigationBar(context: context),
    );
  }
}
