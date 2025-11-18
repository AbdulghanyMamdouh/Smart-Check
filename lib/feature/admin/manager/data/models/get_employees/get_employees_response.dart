import 'employee_dto.dart';

class GetEmployeesResponse {
  bool? success;
  String? mess;
  List<EmployeeDto>? employees;

  GetEmployeesResponse({this.success, this.mess, this.employees});

  factory GetEmployeesResponse.fromJson(Map<String, dynamic> json) =>
      GetEmployeesResponse(
        success: json['success'] as bool?,
        mess: json['mess'] as String?,
        employees: (json['employees'] as List<dynamic>?)
            ?.map((e) => EmployeeDto.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
