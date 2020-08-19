import 'package:flurry/screen/home.dart';
import 'package:flurry/widget/gradient/primary_gradient.dart';
import 'package:flurry/widget/transition_route/fade_transition_route.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  checkLoggedIn() {
    var loggedIn = true;
    print('checkLoggedIn');
    var _duration = new Duration(milliseconds: 2500);
    return new Timer(_duration, () {
      if (loggedIn) {
        redirect(Home());
      } else {
        redirect(Login());
      }
    });
  }

  void redirect(Widget to) {
    Navigator.pushReplacement(context,
        FadeTransitionRoute(screen: to, duration: Duration(milliseconds: 700)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(gradient: VerticalGradient()),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Text(
              'Splash',
              style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    checkLoggedIn();
  }
}