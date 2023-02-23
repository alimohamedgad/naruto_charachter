import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Bussines_Logic/cubit/naruto_cubit.dart';
import '../../../Core/mycolors.dart';
import '../../Widgets/custom_search.dart';
import '../../Widgets/grid_view.dart';

class CharacterNarutoScreen extends StatelessWidget {
  const CharacterNarutoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NarutoCubit, NarutoState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = NarutoCubit.get(context);

        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () => showSearch(
                    context: context, delegate: CustomSearch(cubit.character)),
                icon: const Icon(
                  Icons.search,
                  color: MyColors.myWhite,
                ),
              )
            ],
            backgroundColor: Colors.black,
            elevation: 0,
            title: const Text(
              'Naruto Characters',
              style: TextStyle(color: MyColors.myWhite),
            ),
          ),
          body: ConditionalBuilder(
            condition: cubit.character.isNotEmpty,
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
            builder: (context) => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    BuildGridView(cubit: cubit),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
