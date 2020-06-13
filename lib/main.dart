import 'package:atmui/Phone.dart';

import 'package:atmui/StartPage.dart';
import 'package:atmui/menu.dart';
import 'Phone.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: StartPage.id,
      routes: {
        StartPage.id: (context) => StartPage(),
        Phone.id: (context) => Phone(),
        Menu.id: (context) => Menu()
      },
    );
  }
}
