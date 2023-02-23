import 'dart:convert';

import 'package:naruto_character/Data/Model/character.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseLocalDataSource {
  void cahcedData(List<CharacterModel> model);
  Future<List<CharacterModel>> getCached();
}

var cachedData = 'Charachter';

class LocalDataSource extends BaseLocalDataSource {
  @override
  void cahcedData(List<CharacterModel> model) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List cacheNews = model.map((e) => e.toJson()).toList();
    pref.setString(cachedData, json.encode(cacheNews));
  }

  @override
  Future<List<CharacterModel>> getCached() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final data = pref.getString(cachedData);
    List char = json.decode(data!);
    List<CharacterModel> dataList =
        char.map((e) => CharacterModel.fromJson(e)).toList();
    return dataList;
  }
}
