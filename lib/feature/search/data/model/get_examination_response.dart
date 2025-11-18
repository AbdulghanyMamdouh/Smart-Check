import 'examination.dart';

class GetExaminationResponse {
  bool? success;
  List<Examination>? examinations;
  String? mess;

  GetExaminationResponse({this.success, this.examinations, this.mess});

  factory GetExaminationResponse.fromJson(Map<String, dynamic> json) {
    return GetExaminationResponse(
      success: json['success'] as bool?,
      examinations: (json['examinations'] as List<dynamic>?)
          ?.map((e) => Examination.fromJson(e as Map<String, dynamic>))
          .toList(),
      mess: json['mess'] as String?,
    );
  }
}
