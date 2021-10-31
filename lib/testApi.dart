import 'package:dio/dio.dart';
import 'package:networ_test/http/app_exceptions.dart';

import 'http/api_response.dart';
import 'http/http.dart';

class TestApi {
  static String _article = '/getAllAdvertise';

  static Future<ApiResponse<List<Advertise>>> getScienceArticle() async {
    try {
      final response =
      await Https.instance.get(_article);
      List<Advertise> data =[];
      response["data"].map((e)=>data.add(Advertise.fromJson(e))).toList();
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      var a = AppException.create(e);
      return ApiResponse.error(a);
    }
  }
}


class Advertise {
  int? id;
  int? createdAt;
  int? updatedAt;
  String? cover;

  Advertise({this.id, this.createdAt, this.updatedAt, this.cover});

  Advertise.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    cover = json['cover'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['cover'] = this.cover;
    return data;
  }
}