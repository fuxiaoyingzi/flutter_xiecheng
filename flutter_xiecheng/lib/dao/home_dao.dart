import 'dart:async';
import 'dart:convert';

import 'package:flutter_xiecheng/model/home_model.dart';
import 'package:http/http.dart' as http;

const HOME_URL = "https://www.devio.org/io/flutter_app/json/home_page.json";

///首页大接口
class HomeDao {
  static Future<HomeModel> fetch() async {
    final response = await http.get(HOME_URL);
    if (response.statusCode == 200) {
      Utf8Decoder utf8codec = Utf8Decoder(); //解决中文乱码
      var result = json.decode(utf8codec.convert(response.bodyBytes));
      return HomeModel.fromJson(result);
    } else {
      throw Exception("加载失败");
    }
  }
}
