import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorUtils extends StatelessWidget {
  const ErrorUtils({super.key, required this.errorMsg});
  final String errorMsg;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 100),
          SizedBox(height: 30.h),
          Text(
            errorMsg,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text('Please try again later', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
