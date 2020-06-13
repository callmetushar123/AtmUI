import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  static const String id = "Menu";
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Hello"),
    );
  }
}
