import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/feature/admin/home/presentation/view/widget/fragment_item.dart';

class FragmentScreen extends StatelessWidget {
  const FragmentScreen({super.key});
  static const String routeName = 'fragment_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200.h,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(226, 55, 145, 228),

        title: Text(
          'Fragment Screen',
          style: TextStyle(
            color: ColorManager.white,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 20.0,
        ),
        child: GridView.builder(
          itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) => FragmentItem(index: index),
        ),
      ),
    );
  }
}
