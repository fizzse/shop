import 'package:dio/dio.dart';
import 'package:shop/model/banner_item.dart';

class GlobalConstants {
  static const String baseUrl = "https://meikou-api.itheima.net";
  static const int httpTimeout = 10;
  static const String bannerUrl = "/home/banner";
}

final httpRequest = HttpRequest();

class HttpRequest {
  final _dio = Dio();

  HttpRequest() {
    _dio.options
      ..baseUrl = GlobalConstants.baseUrl
      ..connectTimeout = Duration(seconds: GlobalConstants.httpTimeout)
      ..sendTimeout = Duration(seconds: GlobalConstants.httpTimeout)
      ..receiveTimeout = Duration(seconds: GlobalConstants.httpTimeout);
  }

  // 获取首页轮播图数据
  Future<List<BannerItem>> getBanner() async {
    try {
      var response = await _dio.get(GlobalConstants.bannerUrl);
      var data = response.data as Map<String, dynamic>;
      if (data["code"].toString() != "1") {
        throw Exception("请求失败");
      }

      var list = data["result"] as List;
      return list.map((item) {
        var json = item as Map<String, dynamic>;
        print("img1111111111111: ${json['imgUrl']}");
        return BannerItem.fromJson(json);
      }).toList();
    } catch (err) {
      throw Exception(err);
    }
  }
}
