import 'package:dio/dio.dart';

class DioNews {
  static Dio? dio;
  static init() {
    try {
      dio = Dio(BaseOptions(
          baseUrl: 'https://newsapi.org/', receiveDataWhenStatusError: true));
    } catch (error) {
      print(error);
    }
  }

  static Future<dynamic> getNewsData(
      {required String url,
      required Map<String, dynamic> queryParameters}) async {
    final respose = await dio!.get(url, queryParameters: queryParameters);
    return respose.data;
  }
}
