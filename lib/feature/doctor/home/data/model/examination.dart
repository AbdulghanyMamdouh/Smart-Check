import 'package:smart_check/feature/doctor/home/domain/entity/examination_entity.dart';

class Examination extends ExaminationEntity {
  Examination({
    super.id,
    super.clientName,
    super.clientPhone,
    super.clientCode,
    super.clientAddress,
    super.herdType,
    super.herdAgeInDays,
    super.herdCount,
    super.herdFeedPerDay,
    super.herdWaterPerDay,
    super.herdDied,
    super.compliant,
    super.lastAntibiotic,
    super.immunisationProgram,
    super.anatomy,
    super.diagnosis,
    super.treatment,
    super.createdAt,
    super.employeeUsername,
    super.branchName,
    super.isCompleted,
  });

  factory Examination.fromJson(Map<String, dynamic> json) => Examination(
    id: json['id'] as int?,
    clientName: json['clientName'] as String?,
    clientPhone: json['clientPhone'] as String?,
    clientCode: json['clientCode'] as String?,
    clientAddress: json['clientAddress'] as String?,
    herdType: json['herdType'] as String?,
    herdAgeInDays: json['herdAgeInDays'] as int?,
    herdCount: json['herdCount'] as int?,
    herdFeedPerDay: json['herdFeedPerDay'] as int?,
    herdWaterPerDay: json['herdWaterPerDay'] as int?,
    herdDied: json['herdDied'] as int?,
    compliant: json['compliant'] as String?,
    lastAntibiotic: json['lastAntibiotic'] as String?,
    immunisationProgram: json['immunisationProgram'] as String?,
    anatomy: json['anatomy'] as String?,
    diagnosis: json['diagnosis'] as String?,
    treatment: json['treatment'] as String?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    employeeUsername: json['employeeUsername'] as String?,
    branchName: json['branchName'] as String?,
    isCompleted: json['isCompleted'] as bool?,
  );
}
