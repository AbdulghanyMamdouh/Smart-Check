class GetExaminationByClientIdRequest {
  String? clientId;

  GetExaminationByClientIdRequest({this.clientId});
  Map<String, dynamic> toJson() => {
    'client_code': clientId,
  };
}
