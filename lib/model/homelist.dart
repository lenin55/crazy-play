import 'package:crazy_play/play_app/coins_app_home_screen.dart';
import 'package:flutter/widgets.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
  });

  Widget navigateScreen;
  String imagePath;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/imgs/fitness_app.png',
      navigateScreen: CoinsAppHomeScreen(),
    ),
  ];
}
