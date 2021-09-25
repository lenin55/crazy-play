import 'package:crazy_play/play_app/coins_explore/coins_explore_view.dart';
import 'package:crazy_play/play_app/coins_explore/coins_info_screen.dart';
import 'package:crazy_play/play_app/coins_explore/coins_invested_view.dart';
import 'package:crazy_play/play_app/models/tabIcon_data.dart';
import 'package:crazy_play/play_app/traning/training_screen.dart';
import 'package:crazy_play/play_app/my_profile/profile.dart';
import 'package:crazy_play/play_app/coins_explore/coins_home.dart';

import 'package:flutter/material.dart';
import 'bottom_navigation_view/bottom_bar_view.dart';
import 'coins_app_theme.dart';

class CoinsAppHomeScreen extends StatefulWidget {
  const CoinsAppHomeScreen({Key key, this.animationController})
      : super(key: key);
  final AnimationController animationController;

  @override
  _CoinsAppHomeScreenState createState() => _CoinsAppHomeScreenState();
}

class _CoinsAppHomeScreenState extends State<CoinsAppHomeScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: CoinsAppTheme.background,
  );

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = CoinsHome(animationController: animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CoinsAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0) {
              animationController.reverse().then<dynamic>((data) {
                setState(() {
                  tabBody = CoinsHome(animationController: animationController);
                });
              });
            } else if (index == 1) {
              animationController.reverse().then<dynamic>((data) {
                setState(() {
                  tabBody = CoinsExploreScreen(
                      animationController: animationController);
                });
              });
            } else if (index == 2) {
              animationController.reverse().then<dynamic>((data) {
                setState(() {
                  tabBody = CoinsInvestedScreen(
                      animationController: animationController);
                });
              });
            } else if (index == 3) {
              animationController.reverse().then<dynamic>((data) {
                setState(() {
                  tabBody =
                      ProfileScreen(animationController: animationController);
                });
              });
            }
          },
        ),
      ],
    );
  }
}
