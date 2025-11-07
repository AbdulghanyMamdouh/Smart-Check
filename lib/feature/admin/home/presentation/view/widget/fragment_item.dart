import 'package:flutter/material.dart';

import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/feature/admin/home/presentation/view/screens/home_screen.dart';

class FragmentItem extends StatelessWidget {
  FragmentItem({
    super.key,
    required this.index,
  });
  final int index;
  final List<String> branchNames = [
    'النوبارية',
    "السادات",
    "دمنهور",
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to branch details or perform any action
        Navigator.of(
          context,
        ).pushNamed(HomeScreen.routeName, arguments: branchNames[index]);
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(25),
            topRight: const Radius.circular(25),
            bottomLeft: Radius.circular(
              (index % 2 != 0) ? 0 : 25,
            ),
            bottomRight: Radius.circular(
              (index % 2 != 0) ? 25 : 0,
            ),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Image.asset(
              'assets/images/lab.png',
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.16,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Text(
                branchNames[index],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
