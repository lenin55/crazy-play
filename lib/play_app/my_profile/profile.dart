import 'package:crazy_play/play_app/coins_app_home_screen.dart';
import 'package:crazy_play/play_app/coins_explore/coins_explore_view.dart';
import 'package:crazy_play/play_app/my_profile/contact_us.dart';
import 'package:crazy_play/play_app/my_profile/about_screen.dart';
import 'package:crazy_play/play_app/my_profile/help_screen.dart';
import 'package:crazy_play/play_app/my_profile/invite_friend_screen.dart';
import 'package:crazy_play/play_app/ui_view/profile_tab.dart';
import 'package:crazy_play/play_app/ui_view/profit_view.dart';
import 'package:crazy_play/play_app/ui_view/glass_view.dart';
import 'package:crazy_play/play_app/ui_view/mystats_view.dart';
import 'package:crazy_play/play_app/ui_view/title_view.dart';
import 'package:crazy_play/play_app/coins_app_theme.dart';
import 'package:crazy_play/play_app/coins_explore/investcard_list_view.dart';
import 'package:crazy_play/play_app/coins_explore/matchcard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math';

import 'package:syncfusion_flutter_charts/charts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key, this.animationController}) : super(key: key);

  final AnimationController animationController;
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> topBarAnimation;
  GlobalKey<ScaffoldState> _scaffoldKEy = GlobalKey<ScaffoldState>();
  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;
  List<LineSeries<_ChartData, String>> _getDefaultLineSeries() {
    final List<_ChartData> chartData = <_ChartData>[
      _ChartData('jan', 21, 28),
      _ChartData('Feb', 24, 44),
      _ChartData('Mar', 36, 48),
      _ChartData('Apr', 38, 50),
      _ChartData('May', 54, 66),
      _ChartData('Jun', 57, 78),
      _ChartData('Jul', 70, 84)
    ];
    return <LineSeries<_ChartData, String>>[
      LineSeries<_ChartData, String>(
          animationDuration: 2500,
          dataSource: chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y,
          width: 2,
          name: 'Invested',
          color: CoinsAppTheme.green,
          markerSettings: MarkerSettings(isVisible: true)),
      LineSeries<_ChartData, String>(
          animationDuration: 2500,
          dataSource: chartData,
          width: 2,
          name: 'Withdrawn',
          color: CoinsAppTheme.primary,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y2,
          markerSettings: MarkerSettings(isVisible: true))
    ];
  }

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
    addAllListData();

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

  void addAllListData() {}

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CoinsAppTheme.background,
      child: Scaffold(
        key: _scaffoldKEy,
        drawer: _buildDrawer(),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(),
            // getAppBarUI(),

            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  _buildDrawer() {
    final String image = 'assets/images/userImage.png';
    return ClipPath(
      /// ---------------------------
      /// Building Shape for drawer .
      /// ---------------------------

      clipper: OvalRightBorderClipper(),

      /// ---------------------------
      /// Building drawer widget .
      /// ---------------------------

      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              color: CoinsAppTheme.white,
              boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            /// ---------------------------
            /// Building scrolling  content for drawer .
            /// ---------------------------
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.power_settings_new,
                        color: CoinsAppTheme.darkText,
                      ),
                      onPressed: () {},
                    ),
                  ),

                  /// ---------------------------
                  /// Building header for drawer .
                  /// ---------------------------

                  Container(
                    height: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [
                          CoinsAppTheme.primary,
                          CoinsAppTheme.primary
                        ])),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(image),
                    ),
                  ),
                  SizedBox(height: 5.0),

                  /// ---------------------------
                  /// Building header title for drawer .
                  /// ---------------------------

                  Text(
                    "Lenin Mariya Joseph",
                    style: TextStyle(
                      color: CoinsAppTheme.darkText,
                      fontSize: 18.0,
                      height: 2,
                    ),
                  ),

                  Text(
                    "lenin@gmail.com",
                    style: TextStyle(color: CoinsAppTheme.grey, fontSize: 16.0),
                  ),
                  SizedBox(height: 30.0),

                  /// ---------------------------
                  /// Building items list  for drawer .
                  /// ---------------------------
                  Container(
                    height: 45,
                    child: InkWell(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.home_outlined,
                              color: CoinsAppTheme.darkText,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "Home",
                              style: TextStyle(
                                  color: CoinsAppTheme.darkText,
                                  fontSize: 16.0),
                            ),
                          ]),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CoinsAppHomeScreen(
                                animationController: animationController),
                          ),
                        );
                      },
                    ),
                  ),
                  _buildDivider(),

                  Container(
                    height: 45,
                    child: InkWell(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.business,
                              color: CoinsAppTheme.darkText,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "About us",
                              style: TextStyle(
                                  color: CoinsAppTheme.darkText,
                                  fontSize: 16.0),
                            ),
                          ]),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AboutScreen(
                                animationController: animationController)));
                      },
                    ),
                  ),
                  _buildDivider(),
                  Container(
                    height: 45,
                    child: InkWell(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.email_outlined,
                              color: CoinsAppTheme.darkText,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "Contact Us",
                              style: TextStyle(
                                  color: CoinsAppTheme.darkText,
                                  fontSize: 16.0),
                            ),
                          ]),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ContactScreen(
                                animationController: animationController),
                          ),
                        );
                      },
                    ),
                  ),
                  _buildDivider(),
                  Container(
                    height: 45,
                    child: InkWell(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: CoinsAppTheme.darkText,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "Help",
                              style: TextStyle(
                                  color: CoinsAppTheme.darkText,
                                  fontSize: 16.0),
                            ),
                          ]),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HelpScreen(
                                animationController: animationController),
                          ),
                        );
                      },
                    ),
                  ),
                  _buildDivider(),
                  Container(
                    height: 45,
                    child: InkWell(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.share,
                              color: CoinsAppTheme.darkText,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "Invite Your Friends",
                              style: TextStyle(
                                color: CoinsAppTheme.darkText,
                                fontSize: 16.0,
                              ),
                            ),
                          ]),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InviteFriend(
                                animationController: animationController),
                          ),
                        );
                      },
                    ),
                  ),
                  _buildDivider(),
                  Container(
                    height: 45,
                    child: InkWell(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.logout,
                              color: CoinsAppTheme.darkText,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "Sign Out",
                              style: TextStyle(
                                color: CoinsAppTheme.darkText,
                                fontSize: 16.0,
                              ),
                            ),
                          ]),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CoinsAppHomeScreen(
                                animationController: animationController),
                          ),
                        );
                      },
                    ),
                  ),
                  _buildDivider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: CoinsAppTheme.darkText,
    );
  }

  /// ---------------------------
  /// Building item  for drawer .
  /// ---------------------------

  Widget getMainListViewUI() {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Stack(
      children: <Widget>[
        DefaultTabController(
          length: 2,
          child: NestedScrollView(
            controller: scrollController,
            physics: const NeverScrollableScrollPhysics(),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80.0),
                    bottomRight: Radius.circular(80.0),
                  )),
                  backgroundColor: Colors.white,
                  expandedHeight: (MediaQuery.of(context).size.height * 0.35),
                  collapsedHeight: (MediaQuery.of(context).size.height * 0.25),
                  floating: false,
                  pinned: true,
                  bottom: TabBar(
                    indicatorWeight: 3.0,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: CoinsAppTheme.primary,
                    labelColor: CoinsAppTheme.darkText,
                    tabs: [
                      InkWell(
                        child: new Tab(
                          child: Text(
                            'Overview',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        child: new Tab(
                          child: Text(
                            'Earnings',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ];
            },
            body: Container(
              //Add this to give height
              // height: MediaQuery.of(context).size.height,
              child: TabBarView(
                children: [
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 24,
                        left: 24,
                        right: 24,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          buildDefaultLineChart(context),
                          // _buildCustomizedRadialBarChart(),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 24,
                        left: 24,
                        right: 24,
                      ),
                      child: Text(
                        "Articles Body",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Stack(
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.height * 0.35) -
                  30 * topBarOpacity,
              padding: EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 24),
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
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).padding.top,
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        new Container(
                          width: 45 + 6 - 6 * topBarOpacity,
                          height: 45 + 6 - 6 * topBarOpacity,
                          // margin: const EdgeInsets.only(right: 20.0),
                          decoration: new BoxDecoration(
                            color: CoinsAppTheme.background,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(32.0),
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.account_balance_wallet_outlined,
                              color: CoinsAppTheme.dark_grey,
                              size: 28,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 16,
                      top: 8,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          color: Colors.white,
                          child: Container(
                            width: 80 + 6 - 20 * topBarOpacity,
                            height: 80 + 6 - 20 * topBarOpacity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: CoinsAppTheme.white,
                            ),
                            child: Center(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(85),
                                  child: Image.asset(
                                      'assets/images/userImage.png',
                                      width: 75 + 6 - 20 * topBarOpacity,
                                      height: 75 + 6 - 20 * topBarOpacity,
                                      fit: BoxFit.fill)),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.57,
                                  child: Text(
                                    'Lenin Mariyan fkjnefjen',
                                    textAlign: TextAlign.left,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: CoinsAppTheme.fontName,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 22 + 6 - 6 * topBarOpacity,
                                      letterSpacing: 1.2,
                                      color: CoinsAppTheme.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    '+91 94980 69804',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: CoinsAppTheme.fontName,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13 + 6 - 6 * topBarOpacity,
                                      letterSpacing: 1.2,
                                      color: CoinsAppTheme.white,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: h * (-0.13),
              left: w * (-0.1),
              child: Container(
                width: w * 0.4 + 6 - 20 * topBarOpacity,
                height: h * 0.4 + 6 - 20 * topBarOpacity,
                foregroundDecoration: BoxDecoration(
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
              top: MediaQuery.of(context).padding.top + 34,
              left: 24,
              child: InkWell(
                child: SvgPicture.asset(
                  'assets/imgs/menu.svg',
                  height: 30,
                ),
                onTap: () => _scaffoldKEy.currentState.openDrawer(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  SfCartesianChart buildDefaultLineChart(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      // title: ChartTitle(text: 'Money Flow'),
      legend: Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
          position: LegendPosition.bottom),
      primaryXAxis: CategoryAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          interval: 2,
          majorGridLines: MajorGridLines(width: 0)),
      primaryYAxis: NumericAxis(
          labelFormat: '{value}',
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(color: Colors.transparent)),
      series: _getDefaultLineSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.y2);
  final String x;
  final double y;
  final double y2;
}

class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 40, 0);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height - (size.height / 4),
        size.width - 40, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
