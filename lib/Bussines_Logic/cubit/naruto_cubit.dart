// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naruto_character/Data/Model/all_anime_character.dart';
import 'package:naruto_character/Data/Model/qoute.dart';
import 'package:naruto_character/Data/Web_Sevices/dio.dart';

import '../../Data/Model/character.dart';
import '../../Presintion/Screens/bottom_nav_bar.dart/char_naruto.dart';
import '../../Presintion/Screens/bottom_nav_bar.dart/qoute_naruto.dart';

part 'naruto_state.dart';

class NarutoCubit extends Cubit<NarutoState> {
  NarutoCubit() : super(NarutoInitial());

  static NarutoCubit get(context) => BlocProvider.of(context);

  List<CharacterModel> character = [];
  List<CharacterModel> characterForSearchItem = [];
  bool isSelected = false;

  void getData() {
    emit(NarutoLoading());
    DioHelper.getData('https://naruto-api.herokuapp.com/api/v1/characters')
        .then((value) {
      value.map((e) => character.add(CharacterModel.fromJson(e))).toList();
      // print(value.length);
      emit(NarutoLoaded(characterForSearchItem));
    }).catchError(
      (e) {
        print(e.toString());
        emit(NarutoErorr());
      },
    );
  }

  AnimesModel? animesModel;

  void getAllAnimeData() {
    emit(AllAnimeLoading());
    DioHelper.getAnimeData('https://anime-facts-rest-api.herokuapp.com/api/v1')
        .then((value) {
          animesModel = AnimesModel.fromJson(value?.data);
      print(value?.data);
      emit(AllAnimeLoaded());
    }).catchError(
      (e) {
        print(e.toString());
        emit(NarutoErorr());
      },
    );
  }

   List<QutoeModel> qutoeModel = [];
  void getQuote() {
    emit(QutoeLoading());
    DioHelper.getData(
            'https://animechan.vercel.app/api/quotes/anime?title=naruto&page=3')
        .then((value) {
      value.map((e) => qutoeModel.add(QutoeModel.fromJson(e))).toList();

      print(value.length);
      emit(QutoeLoaded());
    }).catchError(
      (e) {
        print(e.toString());
        emit(NarutoErorr());
      },
    );
  }

  int currentIndex = 0;

  List<Widget> bottomNavWidget = [
    const CharacterNarutoScreen(),
    const QuoteNarutoScreen()
  ];

  void changeCurrentIndex(int index) {
    currentIndex = index;
    emit(ChangeCurrentIndex());
  }


 

}
