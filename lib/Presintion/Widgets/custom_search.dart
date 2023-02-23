import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../../Core/mycolors.dart';
import '../../Data/Model/character.dart';
import 'character_item.dart';

class CustomSearch extends SearchDelegate {
  final List<CharacterModel> characterModel;
  CustomSearch(this.characterModel);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      hintColor: MyColors.myWhite,
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.black,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: MyColors.myWhite,
        ),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(
            Icons.clear,
            color: Color.fromRGBO(255, 255, 255, 1),
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: MyColors.myWhite,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<CharacterModel> searchForList = [];

    for (var item in characterModel) {
      if (item.name.toLowerCase().startsWith(item.name.toLowerCase())) {
        searchForList.add(item);
      }
    }
    return ConditionalBuilder(
      condition: searchForList.isNotEmpty,
      fallback: (context) => const Center(
        child: Text(
          'No Result Found Please Try with Diffrent Search',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
      builder: (context) => Container(
        color: Colors.black,
        child: GridView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
          ),
          itemCount: searchForList.length,
          itemBuilder: (context, index) {
            return BuildGridTileItem(
              char: searchForList[index],
            );
          },
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<CharacterModel> searchForList = [];
    for (var item in characterModel) {
      if (item.name.toLowerCase().contains(query.toLowerCase())) {
        searchForList.add(item);
      }
    }
    return ConditionalBuilder(
      condition: searchForList.isNotEmpty,
      fallback: (context) => const Center(
        child: Text(
          'No Result Found Please Try with Diffrent Search',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
      builder: (context) => Container(
        color: Colors.black,
        child: GridView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
          ),
          itemCount: searchForList.length,
          itemBuilder: (context, index) {
            return BuildGridTileItem(
              char: searchForList[index],
            );
          },
        ),
      ),
    );
  }
}
