import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/feature/home/presentation/view/widget/tab_body.dart';
import 'package:smart_check/feature/home/presentation/view/widget/tab_item.dart';

class CustomTab extends StatefulWidget {
  const CustomTab({super.key});

  @override
  State<CustomTab> createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  int selectedIndex = 0;
  final List<String> tabs = ['Nubaria', 'Sadat', 'Damnhur'];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            tabAlignment: TabAlignment.fill,
            labelPadding: EdgeInsets.symmetric(vertical: 2.h),

            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            splashFactory: NoSplash.splashFactory,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            tabs: tabs
                .map(
                  (branchName) => TabItem(
                    tabName: branchName,
                    isSelected: selectedIndex == tabs.indexOf(branchName),
                  ),
                )
                .toList(),
          ),
          TabBody(branchName: tabs[selectedIndex]),
        ],
      ),
    );
  }
}
