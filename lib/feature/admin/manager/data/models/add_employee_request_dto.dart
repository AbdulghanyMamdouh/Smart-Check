import 'package:smart_check/feature/admin/manager/domain/entity/add_employee_request_entity.dart';

class AddEmployeeRequestDto extends AddEmployeeRequestEntity {
  AddEmployeeRequestDto({
    required super.userName,
    required super.password,
    required super.branchName,
  });

  Map<String, dynamic> toJson() => {
    'username': userName,
    'password': password,
    'branch': branchName,
  };
}
