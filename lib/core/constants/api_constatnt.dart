class ApiConstant {
  static const String baseURL =
      'http://ec2-13-62-223-57.eu-north-1.compute.amazonaws.com:8080/labmanager/';
  static const String adminLogin = 'auth/admin/login';
  static const String employeeLogin = 'auth/employee/login';
  static const String addEmployee = 'admin/add-employee';
  static const String getAllEmployees = 'admin/employees';
  static const String getAllExaminations = 'examination/all';
  static const String getExaminationsByDate = 'search/by-date';
  static const String getExaminationsByClientCode = 'search/by-client_code';

  static const String addExamination = 'examination';
  static const String completeExamination = 'examination/update';
  static const String updateExamination = 'examination/update';
}
