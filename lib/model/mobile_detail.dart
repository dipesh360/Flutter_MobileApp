class MobileDetail {
  String? model;
  String? location;

  MobileDetail({this.model, this.location});

  factory MobileDetail.fromJson(Map<String, dynamic> json) {
    return MobileDetail(
      //           API key name                 API Key name
      model: json["model"] == null ? null : json["model"],
      location: json["location"] == null ? null : json["location"],
    );
  }
}
