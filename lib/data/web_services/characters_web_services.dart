import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test_s/constants/strings.dart';
import 'package:test_s/data/models/characters.dart';

class CharacterWebServices {
  late Dio dio;

  CharacterWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<CharacterModel> getAllCharacters() async {
    try {
      Response response = await dio.get('character');

      return CharacterModel.fromJson(response.data);
    } catch (e) {
      print(e.toString());

      return CharacterModel();
    }
  }
}
