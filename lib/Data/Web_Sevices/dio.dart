import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: 30 * 1000,
        receiveTimeout: 30 * 1000,
      ),
    );
  }

  static Future<List<dynamic>> getData(String url) async {
    Response response = await dio.get(url);
    return response.data;
  }

  static Future<Response?> getAnimeData(String url) async {
    return await dio.get(url);
  }
}
