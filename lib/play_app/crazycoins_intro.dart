import 'dart:math';

import 'package:crazy_play/play_app/coins_app_theme.dart';
import 'package:crazy_play/play_app/login/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class CrazyCoinsIntro extends StatefulWidget {
  static final style = TextStyle(
    color: CoinsAppTheme.white,
    fontSize: 30,
    fontFamily: CoinsAppTheme.fontName,
    fontWeight: FontWeight.w700,
    height: 1.3,
  );

  @override
  _CrazyCoinsIntroState createState() => _CrazyCoinsIntroState();
}

class _CrazyCoinsIntroState extends State<CrazyCoinsIntro> {
  int page = 0;
  LiquidController liquidController;

  get animationController => null;

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  final pages = [
    Container(
      color: Colors.pink,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assets/imgs/logo.svg',
            width: 300,
          ),
          SizedBox(
            height: 100,
          ),
          Column(
            children: <Widget>[
              Text(
                "Welcome to crazyplay",
                style: CrazyCoinsIntro.style,
              ),
              Text(
                "It's the first intro page",
                style: CrazyCoinsIntro.style,
              ),
              // Text(
              //   "Code Studio",
              //   style: CrazyCoinsIntro.style,
              // ),
            ],
          ),
        ],
      ),
    ),
    Container(
      color: Colors.deepPurpleAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assets/imgs/logo.svg',
            width: 300,
          ),
          SizedBox(
            height: 100,
          ),
          Column(
            children: <Widget>[
              Text(
                "Take a",
                style: CrazyCoinsIntro.style,
              ),
              Text(
                "look at",
                style: CrazyCoinsIntro.style,
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      color: Colors.greenAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assets/imgs/logo.svg',
            width: 300,
          ),
          SizedBox(
            height: 100,
          ),
          Column(
            children: <Widget>[
              Text(
                "Liked?",
                style: CrazyCoinsIntro.style,
              ),
              Text(
                "Fork!",
                style: CrazyCoinsIntro.style,
              ),
            ],
          ),
        ],
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: LiquidSwipe(
              enableLoop: false,
              pages: pages,
              slideIconWidget: Icon(
                Icons.arrow_back_ios,
                color: CoinsAppTheme.white.withOpacity(0.4),
              ),
              positionSlideIcon: 0.54,
              onPageChangeCallback: pageChangeCallback,
              waveType: WaveType.liquidReveal,
              liquidController: liquidController,
              ignoreUserGestureWhileAnimating: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Expanded(child: SizedBox()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(pages.length, _buildDot),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextButton(
                onPressed: () {
                  liquidController.animateToPage(
                      page: liquidController.currentPage >= 2
                          ? Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignUpScreen(
                                  animationController: animationController)))
                          : liquidController.currentPage + 1);
                },
                child:
                    Text(liquidController.currentPage >= 2 ? 'Finish' : 'Swipe',
                        style: TextStyle(
                          fontSize: 18,
                          color: CoinsAppTheme.white.withOpacity(0.7),
                        )),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextButton(
                style: TextButton.styleFrom(),
                onPressed: () {
                  liquidController.jumpToPage(
                      page: liquidController.currentPage - 1);
                  // DatabaseReference _testRef =
                  //     FirebaseDatabase.instance.reference().child('lenin');
                  // _testRef.set('hello lenin ${Random().nextInt(1000)}');
                },
                child: Text(
                  liquidController.currentPage == 0 ? ' ' : 'Back',
                  style: TextStyle(
                    fontSize: 18,
                    color: CoinsAppTheme.white.withOpacity(0.7),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page ?? 0) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return new Container(
      width: 25.0,
      child: new Center(
        child: new Material(
          color: Colors.white,
          type: MaterialType.circle,
          child: new Container(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }
}
