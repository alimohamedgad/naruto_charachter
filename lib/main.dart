import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Bussines_Logic/cubit/naruto_cubit.dart';
import 'Data/Web_Sevices/dio.dart';
import 'Presintion/Screens/character_details.dart';

import 'Presintion/Screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  DioHelper.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NarutoCubit()..getData()..getQuote()..getAllAnimeData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: HomePage.id,
        routes: {
          HomePage.id: (context) =>  const HomePage(),
          CharacterDetails.id: (context) => const CharacterDetails()
        },
      ),
    );
  }
}
