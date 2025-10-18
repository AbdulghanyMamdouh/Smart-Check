import 'package:flutter/material.dart';

import 'package:smart_check/core/theme/color_manager.dart';

class TabItem extends StatelessWidget {
  final bool isSelected;

  final String tabName;
  const TabItem({super.key, required this.isSelected, required this.tabName});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 13),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? ColorManager.darkPrimary : Colors.transparent,
        border: Border.all(color: ColorManager.primary, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        tabName,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: isSelected ? ColorManager.white : ColorManager.darkPrimary,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
