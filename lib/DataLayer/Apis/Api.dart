import 'package:bloc_provider/DataLayer/Models/Characters.dart';
import 'package:bloc_provider/constants/strings.dart';
import 'package:dio/dio.dart';

class CharactersApi {
  late Dio dio;

  CharactersApi() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(milliseconds: 60000),
      receiveTimeout: const Duration(milliseconds: 60000),
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('character');

      return response.data["results"];
    } catch (e) {
      print("========e.toString()===========");
      return [];
    }
  }
}
