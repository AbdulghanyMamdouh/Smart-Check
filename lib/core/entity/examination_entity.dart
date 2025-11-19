class ExaminationEntity {
  int? id;
  String? clientName;
  String? clientPhone;
  String? clientCode;
  String? clientAddress;
  String? herdType;
  int? herdAgeInDays;
  int? herdCount;
  int? herdFeedPerDay;
  int? herdWaterPerDay;
  int? herdDied;
  String? compliant;
  String? lastAntibiotic;
  String? immunisationProgram;
  String? anatomy;
  String? diagnosis;
  String? treatment;
  DateTime? createdAt;
  String? employeeUsername;
  String? branchName;
  bool? isCompleted;

  ExaminationEntity({
    this.id,
    this.clientName,
    this.clientPhone,
    this.clientCode,
    this.clientAddress,
    this.herdType,
    this.herdAgeInDays,
    this.herdCount,
    this.herdFeedPerDay,
    this.herdWaterPerDay,
    this.herdDied,
    this.compliant,
    this.lastAntibiotic,
    this.immunisationProgram,
    this.anatomy,
    this.diagnosis,
    this.treatment,
    this.createdAt,
    this.employeeUsername,
    this.branchName,
    this.isCompleted,
  });
}
