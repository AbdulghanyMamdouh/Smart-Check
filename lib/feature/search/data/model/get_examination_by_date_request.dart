class GetExaminationByDateRequest {
  String? date;

  GetExaminationByDateRequest({this.date});
  Map<String, dynamic> toJson() => {
    'date': date,
  };
}
