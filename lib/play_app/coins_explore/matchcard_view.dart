// import 'package:crazy_play/play_app/ui_view/wave_view.dart';
import 'package:crazy_play/play_app/coins_app_theme.dart';
import 'package:crazy_play/main.dart';
import 'package:flutter/material.dart';

class MatchCardView extends StatefulWidget {
  const MatchCardView(
      {Key key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  final AnimationController mainScreenAnimationController;
  final Animation<dynamic> mainScreenAnimation;

  @override
  _MatchCardViewState createState() => _MatchCardViewState();
}

class _MatchCardViewState extends State<MatchCardView>
    with TickerProviderStateMixin {
  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.mainScreenAnimation.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 12, bottom: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: CoinsAppTheme.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(8.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: CoinsAppTheme.grey.withOpacity(0.2),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 16, left: 20, right: 20, bottom: 0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 0, bottom: 0),
                              child: Text(
                                'World Cup T20 League',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: CoinsAppTheme.fontName,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: CoinsAppTheme.darkText,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: Image.asset('assets/flags/us.png',
                                      width: 45, height: 45, fit: BoxFit.fill),
                                ),
                                Text(
                                  'Vs',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: CoinsAppTheme.redStart,
                                  ),
                                ),
                                Container(
                                  child: Image.asset('assets/flags/au.png',
                                      width: 45, height: 45, fit: BoxFit.fill),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.only(
                                      top: 5, bottom: 5, left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    color: CoinsAppTheme.redEnd,
                                    borderRadius: new BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      topRight: Radius.circular(4),
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                    ),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: CoinsAppTheme.redEnd
                                              .withOpacity(0.6),
                                          offset: const Offset(0, 3),
                                          blurRadius: 4.0),
                                    ],
                                  ),
                                  child: Text(
                                    '04H : 23M : 45S',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: CoinsAppTheme.fontName,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      letterSpacing: 0.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
