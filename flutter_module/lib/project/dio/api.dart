import 'package:dio/dio.dart';
import 'package:flutter_module/generated/json/base/json_convert_content.dart';
import 'package:flutter_module/project/dio/api_response.dart';
import 'package:flutter_module/project/dio/bean/home_page_entity.dart';
import 'package:flutter_module/project/dio/http.dart';

class Api{

  static String _url = "";

  static Future<ApiResponse<HomePageEntity>> test(
      {int? pageNum}) async {
    try {
      final response =
      await Https.instance.get(_url, params: {"pageNum": pageNum});
      var data = JsonConvert().fromJson(response);
      //todo
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }
}