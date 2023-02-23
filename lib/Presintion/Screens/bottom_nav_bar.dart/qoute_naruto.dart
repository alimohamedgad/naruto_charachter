import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naruto_character/Presintion/Screens/character_details.dart';
import '../../../Bussines_Logic/cubit/naruto_cubit.dart';
import '../../../Core/mycolors.dart';

class QuoteNarutoScreen extends StatelessWidget {
  const QuoteNarutoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'assets/naruto4.jpg',
      'assets/naruto6.jpg',
      'assets/naruto2.jpg',
      'assets/naruto7.jpg',
      'assets/naruto10.jpg',
      'assets/naruto8.jpg',
      'assets/naji.jpg',
      'assets/naruto6.jpg',
      'assets/naruto10.jpg',
      'assets/naruto5.jpg',
    ];

    return BlocConsumer<NarutoCubit, NarutoState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = NarutoCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Naruto Quote'),
            backgroundColor: Colors.black,
            centerTitle: true,
          ),
          body: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.black,
            ),
            child: ConditionalBuilder(
              condition: cubit.qutoeModel.isNotEmpty,
              fallback: (context) =>
                  const Center(child: CircularProgressIndicator()),
              builder: (context) => ListView.builder(
                itemCount: cubit.qutoeModel.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: MyColors.myWhite,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          images[index],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cubit.qutoeModel[index].character,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 7),
                              Text(
                                cubit.qutoeModel[index].quote,
                                maxLines: 3,
                                style: TextStyle(color: Colors.grey.shade700 , fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
