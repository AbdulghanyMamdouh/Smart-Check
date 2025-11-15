import 'package:smart_check/feature/doctor/home/domain/entity/complete_examination_request_entity.dart';

class CompleteExaminationRequestDto extends CompleteExaminationRequestEntity {
  CompleteExaminationRequestDto({
    super.examinationId,
    super.lastAntibiotic,
    super.immunisationProgram,
    super.anatomy,
    super.diagnosis,
    super.treatment,
  });
  factory CompleteExaminationRequestDto.fromEntity(
    CompleteExaminationRequestEntity entity,
  ) {
    return CompleteExaminationRequestDto(
      anatomy: entity.anatomy,
      diagnosis: entity.diagnosis,
      examinationId: entity.examinationId,
      immunisationProgram: entity.immunisationProgram,
      lastAntibiotic: entity.lastAntibiotic,
      treatment: entity.treatment,
    );
  }
  Map<String, dynamic> toJson() => {
    'examinationId': examinationId,
    'lastAntibiotic': lastAntibiotic,
    'immunisationProgram': immunisationProgram,
    'anatomy': anatomy,
    'diagnosis': diagnosis,
    'treatment': treatment,
  };
}
