import 'package:flutter/material.dart';

import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/feature/admin/home/presentation/view/screens/home_screen.dart';
import 'package:smart_check/feature/search/presentation/view/screens/search_screen.dart';

class FragmentItem extends StatelessWidget {
  FragmentItem({
    super.key,
    required this.index,
  });
  final int index;
  final List<String> branchNames = [
    'النوبارية',
    "مدينة السادات",
    "دمنهور",
    "للبحث بكود العميل",
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (index == 3) {
          Navigator.of(
            context,
          ).pushNamed(
            SearchScreen.routeName,
          );
        }
        // Navigate to branch details or perform any action
        else {
          Navigator.of(
            context,
          ).pushNamed(HomeScreen.routeName, arguments: branchNames[index]);
        }
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
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Text(
              branchNames[index],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                overflow: TextOverflow.clip,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
