import 'package:flurry/widget/button/gradient_button.dart';
import 'package:flurry/widget/gradient/primary_gradient.dart';
import 'package:flurry/widget/transition_route/fade_transition_route.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(40),
          child: Center(
            child: RaisedGradientButton(
                child: Text(
                  '계속',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                gradient: HorizontalGradient(),
                onPressed: () {
                  print('button clicked');
                }),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, FadeTransitionRoute(screen: Home()));
          },
          child: Icon(Icons.delete_forever),
        ),
      ),
    );
  }
}