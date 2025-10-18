import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';

class CustomMenu extends StatefulWidget {
  const CustomMenu({super.key});

  @override
  State<CustomMenu> createState() => _CustomMenuState();
}

class _CustomMenuState extends State<CustomMenu> {
  final List<String> items = ['Movies', 'Sports', 'Musics'];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: selectedValue,
      isExpanded: true,
      underline: SizedBox(),
      borderRadius: BorderRadius.circular(16.r),
      hint: Text(
        'Select Branch Name',
        style: Theme.of(
          context,
        ).textTheme.titleMedium!.copyWith(color: ColorManager.darkPrimary),
      ),
      items: items
          .map(
            (category) =>
                DropdownMenuItem(value: category, child: Text(category)),
          )
          .toList(),
      onChanged: (newValue) {
        selectedValue = newValue;
        setState(() {});
      },
    );
  }
}
