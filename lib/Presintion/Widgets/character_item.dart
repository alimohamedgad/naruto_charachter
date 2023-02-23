import 'package:flutter/material.dart';

import '../../Core/mycolors.dart';
import '../../Data/Model/all_anime_character.dart';

import '../../Data/Model/character.dart';
import '../Screens/character_details.dart';

class BuildGridTileItem extends StatelessWidget {
  final CharacterModel char;
  const BuildGridTileItem({
    Key? key,
    required this.char,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 3),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, CharacterDetails.id, arguments: char);
        },
        child: GridTile(
          child: Container(
            color: Colors.grey,
            child: char.imgs.isNotEmpty
                ? FadeInImage.assetNetwork(
                    height: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: 'assets/loading.gif',
                    image: char.imgs[0])
                : const CircularProgressIndicator(),
          ),
          footer: Container(
            width: double.infinity,
            color: Colors.black45,
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
            alignment: Alignment.bottomCenter,
            child: Text(
              char.name,
              style: const TextStyle(
                fontSize: 16,
                color: MyColors.myWhite,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class BuildGridTileAnimes extends StatelessWidget {
  final AnimesModel animesModel;
  final int index;
  const BuildGridTileAnimes({
    Key? key,
    required this.animesModel,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, CharacterDetails.id);
        },
        child: GridTile(
          child: Container(
            child: animesModel.data![index].image!.isNotEmpty
                ? FadeInImage.assetNetwork(
                    height: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: 'assets/loading.gif',
                    image: "${animesModel.data![index].image}",
                  )
                : const CircularProgressIndicator(),
          ),
          footer: Container(
            width: double.infinity,
            color: Colors.black45,
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
            alignment: Alignment.bottomCenter,
            child: Text(
              "${animesModel.data![index].name}",
              style: const TextStyle(
                fontSize: 16,
                color: MyColors.myWhite,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
