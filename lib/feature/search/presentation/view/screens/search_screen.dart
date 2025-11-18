import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_check/core/theme/color_manager.dart';
import 'package:smart_check/core/widgets/search_text_field.dart';
import 'package:smart_check/feature/search/presentation/view/widgets/condition_item.dart';
import 'package:smart_check/feature/search/presentation/view_model/search_state.dart';
import 'package:smart_check/feature/search/presentation/view_model/search_view_model.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  static const String routeName = 'search';

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SearchViewModel>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color.fromARGB(226, 55, 145, 228),
        actions: [
          /// Date Picker
          IconButton(
            icon: Icon(Icons.calendar_month_outlined),
            iconSize: 40.sp,
            color: ColorManager.white,
            onPressed: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now().subtract(const Duration(days: 120)),
                lastDate: DateTime.now(),
              );

              if (!context.mounted) return;
              if (picked != null) {
                viewModel.getExaminationsByDate(dateTime: picked);
              }
            },
          ),

          /// Client Code Search
          SearchTextField(
            onChanged: (value) {
              if (value.isNotEmpty) {
                viewModel.getExaminationsByClientID(clientCode: value);
              }
            },
          ),
        ],
        title: Text(
          'branchName',
          style: TextStyle(color: ColorManager.white),
        ),
      ),

      /// Body
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<SearchViewModel, SearchState>(
              bloc: viewModel,
              builder: (context, state) {
                /// LOADING
                if (state is GetExByClIDLoading ||
                    state is GetExByDateLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                /// ERROR
                if (state is GetExByClIDError || state is GetExByDateError) {
                  return Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Center(
                      child: Text(
                        state.errorMessage,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  );
                }

                /// SUCCESS (Any success state)
                if (state is GetExByClIDSuccess ||
                    state is GetExByDateSuccess) {
                  final exams = state.examinations;

                  if (exams.isEmpty) {
                    return Padding(
                      padding: EdgeInsets.only(top: 50.h),
                      child: Text(
                        "لا توجد نتائج",
                        style: TextStyle(fontSize: 20.sp),
                      ),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(top: 16.h),
                    itemCount: exams.length,
                    itemBuilder: (_, index) =>
                        ConditionItem(examinationEntity: exams[index]),
                  );
                }

                /// DEFAULT
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
