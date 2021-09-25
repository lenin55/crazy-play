import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crazy_play/play_app/confg/config.dart';
import 'package:crazy_play/play_app/login/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../coins_app_home_screen.dart';
import '../coins_app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key, this.animationController}) : super(key: key);
  final AnimationController animationController;
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      controller: _emailController,
      style: TextStyle(fontSize: 20.0, height: 1),
      decoration: new InputDecoration(
        filled: true,
        fillColor: CoinsAppTheme.background,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: CoinsAppTheme.primary, width: 2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 25.0),
        // hintText: "Email",
        labelText: 'Email',
        labelStyle: TextStyle(fontWeight: FontWeight.w400),
        // helperText: 'Helper Text',
        // counterText: '0 characters',
        // errorText: 'Error Text',
      ),
    );

    final passwordField = TextField(
      controller: _passwordController,
      obscureText: true,
      style: TextStyle(fontSize: 20.0, height: 1),
      decoration: InputDecoration(
        filled: true,
        fillColor: CoinsAppTheme.background,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: CoinsAppTheme.primary, width: 2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 25.0),

        // hintText: "Password",
        labelText: 'Password',
        labelStyle: TextStyle(fontWeight: FontWeight.w400),
        // helperText: 'Helper Text',
        // counterText: '0 characters',
        // errorText: 'Error Text',
        // prefix: Text('+91'),

        suffixIcon: Icon(
          Icons.visibility,
          color: CoinsAppTheme.grey,
        ),
      ),
    );

    return new Scaffold(
      body: Container(
        child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Container(
                color: CoinsAppTheme.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Center(
                                    child: SvgPicture.asset(
                                  'assets/imgs/logo.svg',
                                  width: 90,
                                )),
                                Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Text(
                                    'Crazy Coins \nInvestment',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: CoinsAppTheme.fontName,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 32,
                                      letterSpacing: 1.2,
                                      color: CoinsAppTheme.darkerText,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 48.0),
                          emailField,
                          SizedBox(height: 24.0),
                          passwordField,
                          InkWell(
                            child: Text(
                              'Forgot password?',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                height: 2,
                                color: CoinsAppTheme.primary,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 24.0,
                          ),
                          Container(
                            height: 70,
                            width: 70,
                            child: FloatingActionButton(
                              onPressed: () {
                                //login function code
                                // _emailController.text.isNotEmpty &&
                                //         _passwordController.text.isNotEmpty
                                //     ? loginUser()
                                //     : showDialog(
                                //         context: context,
                                //         builder: (c) {
                                //           return AlertDialog(
                                //               title: Text(
                                //                   'Please enter email and password'),
                                //               actions: [
                                //                 TextButton(
                                //                   onPressed: () {
                                //                     Navigator.pop(context);
                                //                   },
                                //                   child: Text('ok'),
                                //                 )
                                //               ]);
                                //         });

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CoinsAppHomeScreen(
                                        animationController:
                                            animationController),
                                  ),
                                );
                              },
                              backgroundColor: CoinsAppTheme.dark_grey,
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'Sign in with',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: CoinsAppTheme.grey,
                                ),
                              ),
                              InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: SvgPicture.asset(
                                    'assets/imgs/g.svg',
                                    width: 45,
                                  ),
                                ),
                              ),
                              InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: SvgPicture.asset(
                                    'assets/imgs/fb.svg',
                                    width: 45,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 24.0,
                          ),
                        ],
                      ),
                    )),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                          child: GestureDetector(
                        child: RichText(
                            text: TextSpan(
                                text: 'Not a member? ',
                                style: TextStyle(
                                    color: CoinsAppTheme.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                                children: <TextSpan>[
                              TextSpan(
                                text: 'Sign up now!',
                                style: TextStyle(
                                  color: CoinsAppTheme.primary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ])),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(
                                  animationController: animationController),
                            ),
                          );
                        },
                      )),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  void loginUser() async {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text('Authenticating...'),
            ));
    User user;
    await _firebaseAuth
        .signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    )
        .then((authUser) {
      user = authUser.user;
    }).catchError((error) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
            title: Text('Please enter valid email and password'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('ok'),
              )
            ]),
      );
    });
    if (user != null) {
      readData(user).then((s) {
        Navigator.pop(context);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) =>
                CoinsAppHomeScreen(animationController: animationController)));
      });
    }
  }

  Future readData(User fUser) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(fUser.uid)
        .get()
        .then((dataSnapshot) async {
      await CrazyCoinsApp.sharedPreferences.setString(
          CrazyCoinsApp.userUID, dataSnapshot.data()[CrazyCoinsApp.userUID]);
      await CrazyCoinsApp.sharedPreferences.setString(CrazyCoinsApp.userEmail,
          dataSnapshot.data()[CrazyCoinsApp.userEmail]);
      await CrazyCoinsApp.sharedPreferences.setString(
          CrazyCoinsApp.userName, dataSnapshot.data()[CrazyCoinsApp.userName]);
      List<String> slotList =
          dataSnapshot.data()[CrazyCoinsApp.userSlotList].cast<String>();
      await CrazyCoinsApp.sharedPreferences
          .setStringList(CrazyCoinsApp.userSlotList, slotList);
    });
  }
}
