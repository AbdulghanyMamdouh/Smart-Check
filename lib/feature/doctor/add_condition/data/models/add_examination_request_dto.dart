import 'package:smart_check/feature/doctor/add_condition/domain/entity/add_examination_request_entity.dart';

class AddExaminationRequestDto extends AddExaminationRequestEntity {
  AddExaminationRequestDto({
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
  });
  Map<String, dynamic> toJson() => {
    'clientName': clientName,
    'clientPhone': clientPhone,
    'clientCode': clientCode,
    'clientAddress': clientAddress,
    'herdType': herdType,
    'herdAgeInDays': herdAgeInDays,
    'herdCount': herdCount,
    'herdFeedPerDay': herdFeedPerDay,
    'herdWaterPerDay': herdWaterPerDay,
    'herdDied': herdDied,
    'compliant': compliant,
  };
  factory AddExaminationRequestDto.fromEntity(
    AddExaminationRequestEntity entity,
  ) {
    return AddExaminationRequestDto(
      clientName: entity.clientName,
      clientPhone: entity.clientPhone,
      clientCode: entity.clientCode,
      clientAddress: entity.clientAddress,
      herdType: entity.herdType,
      herdAgeInDays: entity.herdAgeInDays,
      herdCount: entity.herdCount,
      herdFeedPerDay: entity.herdFeedPerDay,
      herdWaterPerDay: entity.herdWaterPerDay,
      herdDied: entity.herdDied,
      compliant: entity.compliant,
    );
  }
  AddExaminationRequestEntity fromDtoToEntity() {
    return AddExaminationRequestEntity(
      clientAddress: clientAddress,
      clientCode: clientCode,
      clientName: clientName,
      clientPhone: clientPhone,
      herdAgeInDays: herdAgeInDays,
      herdCount: herdCount,
      herdDied: herdDied,
      herdFeedPerDay: herdFeedPerDay,
      herdType: herdType,
      herdWaterPerDay: herdWaterPerDay,
      compliant: compliant,
    );
  }
}
