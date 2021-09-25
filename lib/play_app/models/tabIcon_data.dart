import 'package:flutter/material.dart';

class TabIconData {
  TabIconData({
    this.imagePath = '',
    this.index = 0,
    this.selectedImagePath = '',
    this.isSelected = false,
    this.animationController,
    this.size = 25,
    this.selectedSize = 35,
  });

  String imagePath;
  String selectedImagePath;
  double size;
  double selectedSize;
  bool isSelected;
  int index;

  AnimationController animationController;

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      imagePath: 'assets/imgs/home.svg',
      selectedImagePath: 'assets/imgs/home1.svg',
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/imgs/coins.svg',
      selectedImagePath: 'assets/imgs/coins1.svg',
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/imgs/invest.svg',
      selectedImagePath: 'assets/imgs/invest1.svg',
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/imgs/profile.svg',
      selectedImagePath: 'assets/imgs/profile1.svg',
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];
}
