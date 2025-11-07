import 'package:flutter/material.dart';
import 'package:smart_check/feature/admin/home/presentation/view/widget/condition_item.dart';

class TabBody extends StatelessWidget {
  const TabBody({super.key, required this.branchName});
  final String branchName;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (_, index) => ConditionItem(branchName: branchName),
      ),
    );
  }
}
