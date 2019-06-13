import 'package:flutter/material.dart';

class Switcher extends StatelessWidget {
  final bool condition;
  final Widget trueWidget;
  final Widget falseWidget;


  Switcher({this.condition, this.trueWidget, this.falseWidget});

  @override
  Widget build(BuildContext context) {
    return condition ? trueWidget : falseWidget;
  }
}