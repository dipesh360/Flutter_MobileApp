import 'dart:convert';
import 'package:http/http.dart';
import 'package:mobile_app/model/mobile.dart';

class ApiService {
  final endPoint = "http://firstoffer.co.in/api/mobile/list";

  Future<List<Mobile>> getMobile() async {
    Response response = await get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json["data"];
      List<Mobile> mobiles =
          body.map((dynamic item) => Mobile.fromJson(item)).toList();
      return mobiles;
    } else {
      throw ("Data has error");
    }
  }
}
