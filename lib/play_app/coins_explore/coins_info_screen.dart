import 'package:crazy_play/play_app/coins_app_theme.dart';
import 'package:crazy_play/play_app/coins_explore/success.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CoinsInfoScreen extends StatefulWidget {
  static const routeName = '/CoinsInfoScreen';
  const CoinsInfoScreen({Key key, this.animationController}) : super(key: key);

  final AnimationController animationController;
  @override
  _CoinsInfoScreenState createState() => _CoinsInfoScreenState();
}

class _CoinsInfoScreenState extends State<CoinsInfoScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
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
      color: CoinsAppTheme.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(),
            getAppBarUI(),
            joinNowButtonUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget joinNowButtonUI() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: CoinsAppTheme.white,
        padding: EdgeInsets.only(
          top: 8,
          bottom: 8,
          left: 24,
          right: 24,
        ),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => JoinedSuccessScreen()));
            });
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          ),
          child: Text(
            "Join Now!",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }

  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      // future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        return ListView.builder(
          controller: scrollController,
          padding: EdgeInsets.only(
            top: (MediaQuery.of(context).size.height * 0.40),
            bottom: 62 + MediaQuery.of(context).padding.bottom,
          ),
          itemCount: 1,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            widget.animationController.forward();
            return Container(
              // height: (MediaQuery.of(context).size.height * 0.60) -
              //     30 * topBarOpacity,
              child: Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 24,
                        left: 24,
                        right: 24,
                        bottom: 100 + MediaQuery.of(context).padding.bottom,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: 8,
                            ),
                            child: Text(
                              'Benefits',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: CoinsAppTheme.fontName,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: CoinsAppTheme.darkText,
                              ),
                            ),
                          ),
                          SizedBox(
                            child: new ListView(
                              padding: EdgeInsets.all(0),
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: <Widget>[
                                ListTile(
                                  dense: true,
                                  visualDensity: VisualDensity(
                                      horizontal: -4, vertical: -2),
                                  horizontalTitleGap: 0,
                                  contentPadding: EdgeInsets.all(0),
                                  leading: Icon(
                                    Icons.check_circle,
                                    size: 20,
                                    color: CoinsAppTheme.green,
                                  ),
                                  title: Text(
                                    'This is the dummy text for testing purpose',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      height: 1,
                                      color: CoinsAppTheme.darkText,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  dense: true,
                                  visualDensity: VisualDensity(
                                      horizontal: -4, vertical: -2),
                                  horizontalTitleGap: 0,
                                  contentPadding: EdgeInsets.all(0),
                                  leading: Icon(
                                    Icons.check_circle,
                                    size: 20,
                                    color: CoinsAppTheme.green,
                                  ),
                                  title: Text(
                                    'This is the dummy text for testing purpose',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      height: 1,
                                      color: CoinsAppTheme.darkText,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  dense: true,
                                  visualDensity: VisualDensity(
                                      horizontal: -4, vertical: -2),
                                  horizontalTitleGap: 0,
                                  contentPadding: EdgeInsets.all(0),
                                  leading: Icon(
                                    Icons.check_circle,
                                    size: 20,
                                    color: CoinsAppTheme.green,
                                  ),
                                  title: Text(
                                    'This is the dummy text for testing purpose',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      height: 1,
                                      color: CoinsAppTheme.darkText,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Wrap(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(top: 8),
                                  color: CoinsAppTheme.lite_grey,
                                  padding: const EdgeInsets.all(16.0),
                                  child: RichText(
                                      text: TextSpan(
                                          text: 'Note: ',
                                          style: TextStyle(
                                              color: CoinsAppTheme.darkText,
                                              fontSize: 14,
                                              height: 1.3,
                                              fontWeight: FontWeight.w400),
                                          children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              'Lorem ipsum dolor sit amet, Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                                          style: TextStyle(
                                            color: CoinsAppTheme.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ]))),
                            ],
                          ),
                          Wrap(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(top: 8),
                                  color: CoinsAppTheme.lite_grey,
                                  padding: const EdgeInsets.all(16.0),
                                  child: RichText(
                                      text: TextSpan(
                                          text: 'Note: ',
                                          style: TextStyle(
                                              color: CoinsAppTheme.darkText,
                                              fontSize: 14,
                                              height: 1.3,
                                              fontWeight: FontWeight.w400),
                                          children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              'Lorem ipsum dolor sit amet, Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                                          style: TextStyle(
                                            color: CoinsAppTheme.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ]))),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 16),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50.0)),
                                  ),
                                  child: Center(
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(85),
                                        child: Image.asset(
                                            'assets/images/userImage.png',
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.fill)),
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  height: 50,
                                  margin: EdgeInsets.only(left: 35),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50.0)),
                                  ),
                                  child: Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(85),
                                      child: Image.asset(
                                          'assets/images/userImage.png',
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  height: 50,
                                  margin: EdgeInsets.only(left: 70),
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    border: Border.all(color: Colors.white),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50.0)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'A',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget getAppBarUI() {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController,
          builder: (BuildContext context, Widget child) {
            return FadeTransition(
              opacity: topBarAnimation,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation.value), 0.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: (MediaQuery.of(context).size.height * 0.40) -
                          30 * topBarOpacity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            CoinsAppTheme.redStart,
                            CoinsAppTheme.redEnd,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(32.0),
                          bottomRight: Radius.circular(32.0),
                        ),
                        // boxShadow: <BoxShadow>[
                        //   BoxShadow(
                        //       color: CoinsAppTheme.grey
                        //           .withOpacity(0.4 * topBarOpacity),
                        //       offset: const Offset(1.1, 1.1),
                        //       blurRadius: 10.0),
                        // ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: MediaQuery.of(context).padding.top,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 24,
                                right: 24,
                                top: 16 - 8.0 * topBarOpacity,
                                bottom: 16 - 8.0 * topBarOpacity),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: RichText(
                                          text: TextSpan(
                                              text: '30',
                                              style: TextStyle(
                                                fontFamily: 'js',
                                                fontWeight: FontWeight.w400,
                                                fontSize:
                                                    42 + 6 - 6 * topBarOpacity,
                                                letterSpacing: 1,
                                                color: CoinsAppTheme.white,
                                              ),
                                              children: <TextSpan>[
                                            TextSpan(
                                              text: 'Days',
                                              style: TextStyle(
                                                fontFamily: 'js',
                                                fontWeight: FontWeight.w300,
                                                fontSize:
                                                    18 + 6 - 6 * topBarOpacity,
                                                letterSpacing: 1.2,
                                                color: CoinsAppTheme.white,
                                              ),
                                            ),
                                          ]))),
                                ),
                                InkWell(
                                  highlightColor: Colors.transparent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0)),
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 26,
                                          child: Icon(
                                            Icons.person,
                                            color: CoinsAppTheme.white,
                                            size: 20,
                                          ),
                                        ),
                                        Text(
                                          '200',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily: CoinsAppTheme.fontName,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20,
                                            height: 1.3,
                                            letterSpacing: 0.5,
                                            color: CoinsAppTheme.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        child: Container(
                          width: 45 + 6 - 6 * topBarOpacity,
                          height: 45 + 6 - 6 * topBarOpacity,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            color: CoinsAppTheme.dark_grey,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: CoinsAppTheme.grey
                                      .withOpacity(0.4 * topBarOpacity),
                                  offset: const Offset(1.1, 1.1),
                                  blurRadius: 10.0),
                            ],
                          ),
                          child: InkWell(
                            child: Icon(
                              // multiple ? Icons.dashboard : Icons.view_agenda,
                              Icons.share,
                              color: Colors.white,
                            ),
                            onTap: () {
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: h * (-0.13),
                      left: w * (-0.1),
                      child: Container(
                        width: w * 0.4 + 6 - 20 * topBarOpacity,
                        height: h * 0.4 + 6 - 20 * topBarOpacity,
                        decoration: BoxDecoration(
                          color: CoinsAppTheme.nearlyWhite.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      top: h * (-0.10),
                      left: w * (-0.05),
                      child: Container(
                        width: w * 0.2 + 6 - 20 * topBarOpacity,
                        height: h * 0.3 + 6 - 20 * topBarOpacity,
                        foregroundDecoration: BoxDecoration(
                          color: CoinsAppTheme.nearlyWhite.withOpacity(0.2),
                          shape: BoxShape.circle,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: CoinsAppTheme.redStart.withOpacity(0.2),
                                offset: const Offset(1.1, 1.1),
                                blurRadius: 10.0),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 24,
                      left: 16,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: CoinsAppTheme.white,
                          size: 36,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 24,
                      left: 24,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Expiring',
                            style: TextStyle(
                              fontFamily: CoinsAppTheme.fontName,
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                              height: 1.5,
                              letterSpacing: 0.5,
                              color: CoinsAppTheme.white,
                            ),
                          ),
                          Text(
                            '02h: 30m: 15s',
                            style: TextStyle(
                              fontFamily: CoinsAppTheme.fontName,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              letterSpacing: 0.5,
                              color: CoinsAppTheme.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
