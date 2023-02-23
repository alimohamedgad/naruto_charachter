import 'package:flutter/material.dart';

import '../../Core/mycolors.dart';
import '../../Data/Model/character.dart';

class CharacterDetails extends StatelessWidget {
  const CharacterDetails({
    Key? key,
  }) : super(key: key);

  static String id = 'CharacterDetails';

  @override
  Widget build(BuildContext context) {
    CharacterModel char =
        ModalRoute.of(context)!.settings.arguments as CharacterModel;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          MySliverAppbar(char: char),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CharacterInfo(name: 'Name : ', value: char.name),
                      const MyDivider(endIndent: 265),
                      CharacterInfo(name: 'About : ', value: char.about[1] , font: 15),
                      const MyDivider(endIndent: 265),
                      CharacterInfo(name: 'Sex : ', value: char.info.sex , font: 15),
                      const MyDivider(endIndent: 280),
                        CharacterInfo(name: 'Affiliation : ', value: char.info.affiliation , font: 15),
                      const MyDivider(endIndent: 230),
                   
                    ],
                  ),
                ),
                const SizedBox(height: 455),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CharacterInfo extends StatelessWidget {
  final String name;
  final String value;
  final double? font;

  const CharacterInfo({
    Key? key,
    required this.name,
    required this.value,
     this.font = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
              text: name,
              style: const TextStyle(color: MyColors.myWhite, fontSize: 20)),
          TextSpan(
            text: value,
            
            style: TextStyle(color: Colors.white, fontSize: font,),
          ),
        ],
      ),
    );
  }
}

class MyDivider extends StatelessWidget {
  final double endIndent;
  const MyDivider({Key? key, required this.endIndent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.deepOrange,
      endIndent: endIndent,
      thickness: 2,
    );
  }
}

class MySliverAppbar extends StatelessWidget {
  const MySliverAppbar({
    Key? key,
    required this.char,
  }) : super(key: key);

  final CharacterModel char;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      backgroundColor: Colors.black,
      elevation: 0,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(char.name),
        background: Image.network(char.imgs[0], fit: BoxFit.cover),
      ),
    );
  }
}
