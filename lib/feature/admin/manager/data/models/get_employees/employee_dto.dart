import 'package:smart_check/feature/admin/manager/domain/entity/employee_entity.dart';

class EmployeeDto extends EmployeeEntity {
  EmployeeDto({super.username, super.addedBy, super.branch});

  factory EmployeeDto.fromJson(Map<String, dynamic> json) => EmployeeDto(
    username: json['username'] as String?,
    addedBy: json['addedBy'] as String?,
    branch: json['branch'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'username': username,
    'addedBy': addedBy,
    'branch': branch,
  };
}
