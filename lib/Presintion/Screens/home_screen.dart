import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../../Bussines_Logic/cubit/naruto_cubit.dart';
import '../../Core/mycolors.dart';

class HomePage extends StatelessWidget {
  static const String id = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NarutoCubit, NarutoState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NarutoCubit.get(context);
        return OfflineBuilder(
            connectivityBuilder:
                ( context, ConnectivityResult value, Widget child) {
              final bool connected = value != ConnectivityResult.none;
              if (connected) {
                return Scaffold(
                  bottomNavigationBar: BottomNavigationBar(
                    onTap: (int index) => cubit.changeCurrentIndex(index),
                    selectedItemColor: cubit.isSelected == false
                        ? Colors.deepOrange
                        : MyColors.myWhite,
                    unselectedItemColor: cubit.isSelected == false
                        ? MyColors.myWhite
                        : Colors.deepOrange,
                    backgroundColor: Colors.black,
                    currentIndex: cubit.currentIndex,
                    elevation: 0.0,
                    selectedIconTheme: const IconThemeData(color: MyColors.myWhite),
                    items: [
                      BottomNavigationBarItem(
                        icon: cubit.currentIndex == 0
                            ? Image.asset(
                                'assets/narutoicon.png',
                                height: 25,
                                color: Colors.deepOrange,
                              )
                            : Image.asset(
                                'assets/narutoicon.png',
                                height: 25,
                                color: MyColors.myWhite,
                              ),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: cubit.currentIndex == 1
                            ? Image.asset(
                                'assets/quote.png',
                                height: 25,
                                color: Colors.deepOrange,
                              )
                            : Image.asset(
                                'assets/quote.png',
                                height: 25,
                                color: MyColors.myWhite,
                              ),
                        label: 'Qoute',
                      ),
                    ],
                  ),
                  body: cubit.bottomNavWidget[cubit.currentIndex],
                );
              } else {
                return buildNoInterNetWidget();
              }
            },
            child: const Center(child: CircularProgressIndicator()));
      },
    );
  }

  Widget buildNoInterNetWidget() {
    return Scaffold(
      body: Center(
        child: Container(
          color: MyColors.myWhite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Can't connect .. Check internet",
                style: TextStyle(fontSize: 22, color: MyColors.myGrey),
              ),
              Image.asset('assets/noInternet.png'),
            ],
          ),
        ),
      ),
    );
  }
}
