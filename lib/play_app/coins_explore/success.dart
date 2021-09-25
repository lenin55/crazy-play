import 'package:crazy_play/play_app/coins_app_home_screen.dart';
import 'package:crazy_play/play_app/coins_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class JoinedSuccessScreen extends StatefulWidget {
  static const routeName = '/JoinedSuccessScreen';
  const JoinedSuccessScreen({Key key, this.animationController})
      : super(key: key);
  final AnimationController animationController;

  @override
  _JoinedSuccessScreenState createState() => _JoinedSuccessScreenState();
}

class _JoinedSuccessScreenState extends State<JoinedSuccessScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'assets/imgs/logo.svg',
                width: width * .7,
                height: height * .4,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Text('Successfully Joined!',
                    style: TextStyle(
                        color: CoinsAppTheme.darkText,
                        fontSize: 35,
                        fontWeight: FontWeight.w700)),
              ),
              Text(
                'You have successfully joined in the slot',
                style: TextStyle(
                    fontSize: 18,
                    color: CoinsAppTheme.darkText,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CoinsAppHomeScreen(
                            animationController: animationController),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: CoinsAppTheme.primary,
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                  ),
                  child: Text(
                    "Home",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
