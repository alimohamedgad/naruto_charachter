import 'package:flutter/material.dart';

import '../../Bussines_Logic/cubit/naruto_cubit.dart';
import 'character_item.dart';

class BuildGridView extends StatelessWidget {
  const BuildGridView({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final NarutoCubit cubit;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemCount: cubit.character.length,
      itemBuilder: (context, index) {
        return BuildGridTileItem(
          char: cubit.character[index],
        );
      },
    );
  }
}



class MYBuildGridView extends StatelessWidget {
  const MYBuildGridView({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final NarutoCubit cubit;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemCount: cubit.animesModel?.data?.length,
      itemBuilder: (context, index) {
        return BuildGridTileAnimes(
          animesModel:  cubit.animesModel!,
          index: index,
        );
      },
    );
  }
}
