class GetExaminationByDateRequest {
  DateTime? date;

  GetExaminationByDateRequest({this.date});
  Map<String, dynamic> toJson() => {
    'date': date,
  };
}
