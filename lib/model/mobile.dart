import 'package:mobile_app/model/mobile_detail.dart';

class Mobile {
  String? name;
  String? company;
  String? mobile_image;
  String? description;
  double? price;
  MobileDetail? mobile_detail;

  Mobile(
      {this.name,
      this.company,
      this.mobile_image,
      this.description,
      this.price,
      this.mobile_detail});

  factory Mobile.fromJson(Map<String, dynamic> json) {
    return Mobile(
      name: json["name"] == null ? null : json["name"],
      company: json["company"] == null ? null : json["company"],
      mobile_image: json["mobile_image"] == null ? null : json["mobile_image"],
      description: json["description"] == null ? null : json["description"],
      price: json["price"] == null ? null : json["price"],
      mobile_detail: MobileDetail.fromJson(json["details"]) == null
          ? null
          : MobileDetail.fromJson(json["details"]),
    );
  }
}
