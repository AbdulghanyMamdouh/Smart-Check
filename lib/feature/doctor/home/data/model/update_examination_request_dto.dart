import 'package:smart_check/feature/doctor/home/domain/entity/update_examination_entity.dart';

class UpdateExaminationRequestDto extends UpdateExaminationEntity {
  UpdateExaminationRequestDto({
    required super.id,
    required super.key,
    required super.value,
  });
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      key: value,
    };
  }
}
