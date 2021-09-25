import 'package:crazy_play/play_app/confg/config.dart';
import 'package:crazy_play/play_app/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:crazy_play/play_app/coins_app_home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../coins_app_home_screen.dart';
import '../coins_app_theme.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key, this.animationController}) : super(key: key);
  final AnimationController animationController;

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    super.initState();
  }

  void _registerUser() async {
    User user;

    await _firebaseAuth
        .createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    )
        .then((auth) {
      user = auth.user;
    }).catchError((error) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: Text('Please enter valid email and password'),
                actions: <Widget>[
                  InkWell(
                      child: Text('ok'),
                      onTap: () => Navigator.pop(context, 'ok'))
                ],
              ));
    });

    if (user != null) {
      saveUserInfoToFireStore(user).then((value) {
        Navigator.pop(context);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) =>
                CoinsAppHomeScreen(animationController: animationController)));
      });
    }
  }

  Future saveUserInfoToFireStore(User fUser) async {
    FirebaseFirestore.instance.collection('users').doc(fUser.uid).set({
      "uid": fUser.uid,
      "email": fUser.email,
      "name": _nameController.text.trim(),
      CrazyCoinsApp.userSlotList: ["childInvestment"],
    });
    await CrazyCoinsApp.sharedPreferences.setString("uid", fUser.uid);
    await CrazyCoinsApp.sharedPreferences
        .setString(CrazyCoinsApp.userEmail, fUser.email);
    await CrazyCoinsApp.sharedPreferences
        .setString(CrazyCoinsApp.userName, _nameController.text);
    await CrazyCoinsApp.sharedPreferences
        .setStringList(CrazyCoinsApp.userSlotList, ["childInvestment"]);
  }

  @override
  Widget build(BuildContext context) {
    final usernameField = TextField(
      controller: _nameController,
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
          borderSide: BorderSide(color: CoinsAppTheme.primary),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 25.0),
        // hintText: "Username",
        labelText: 'Username',
        // labelStyle: TextStyle(backgroundColor: CoinsAppTheme.background),
        // helperText: 'Helper Text',
        // counterText: '0 characters',
        // errorText: 'Error Text',
      ),
    );
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
          borderSide: BorderSide(color: CoinsAppTheme.primary),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 25.0),
        // hintText: "Email",
        labelText: 'Email',
        // labelStyle: TextStyle(backgroundColor: CoinsAppTheme.background),
        // helperText: 'Helper Text',
        // counterText: '0 characters',
        // errorText: 'Error Text',
      ),
    );
    // final mobileNumber = TextField(
    //   style: TextStyle(fontSize: 20.0, height: 1),
    //   decoration: new InputDecoration(
    //     filled: true,
    //     fillColor: CoinsAppTheme.background,
    //     enabledBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(10.0),
    //       borderSide: BorderSide(color: Colors.white),
    //     ),
    //     focusedBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(10.0),
    //       borderSide: BorderSide(color: CoinsAppTheme.primary),
    //     ),
    //     border: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(10.0),
    //     ),
    //     contentPadding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 25.0),
    //     // hintText: "Email",
    //     labelText: 'Mobile number',
    //     prefix: Text('+91'),
    //     // labelStyle: TextStyle(backgroundColor: CoinsAppTheme.background),
    //     // helperText: 'Helper Text',
    //     // counterText: '0 characters',
    //     // errorText: 'Error Text',
    //   ),
    // );
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
          borderSide: BorderSide(color: CoinsAppTheme.primary),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 25.0),

        // hintText: "Password",
        labelText: 'Password',
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
                    Form(
                      key: _formKey,
                      child: Container(
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
                            usernameField,
                            SizedBox(height: 24.0),
                            emailField,
                            // mobileNumber,
                            SizedBox(height: 24.0),
                            passwordField,
                            // InkWell(
                            //   child: Text(
                            //     'Forgot password?',
                            //     textAlign: TextAlign.right,
                            //     style: TextStyle(
                            //       fontWeight: FontWeight.w400,
                            //       fontSize: 16,
                            //       height: 2,
                            //       color: CoinsAppTheme.primary,
                            //     ),
                            //   ),
                            // ),
                            SizedBox(
                              height: 24.0,
                            ),
                            Container(
                              height: 70,
                              width: 70,
                              child: FloatingActionButton(
                                onPressed: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CoinsAppHomeScreen(
                                          animationController:
                                              animationController),
                                    ),
                                  );
                                  // await _firebaseAuth
                                  //     .createUserWithEmailAndPassword(
                                  //         email: _emailController.text,
                                  //         // username: _usernameController.text,
                                  //         password: _passwordController.text)
                                  //     .then((_) {
                                  //   Navigator.of(context).pushReplacement(
                                  //       MaterialPageRoute(
                                  //           builder: (context) =>
                                  //               CoinsAppHomeScreen(
                                  //                   animationController:
                                  //                       animationController)));
                                  // });
                                  // _registerUser();
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
                                  'Sign up with',
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
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                          child: InkWell(
                        child: RichText(
                            text: TextSpan(
                                text: 'Already have an account? ',
                                style: TextStyle(
                                    color: CoinsAppTheme.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                                children: <TextSpan>[
                              TextSpan(
                                text: 'Sign in',
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
                              builder: (context) => LoginScreen(
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
}
