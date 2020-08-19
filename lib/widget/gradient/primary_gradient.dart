import 'package:flutter/material.dart';

class VerticalGradient extends LinearGradient {
  final AlignmentGeometry begin = Alignment.topCenter;
  final AlignmentGeometry end = Alignment.bottomCenter;

  VerticalGradient()
      : super(
          colors: [
            Color(0xff00e5ff),
            Color(0xff1200ff),
          ],
        );
}

class HorizontalGradient extends LinearGradient {
  final AlignmentGeometry begin = Alignment.topLeft;
  final AlignmentGeometry end = Alignment.bottomRight;

  HorizontalGradient()
      : super(
          colors: [
            Color(0xff00e5ff),
            Color(0xff1200ff),
          ],
        );
}
