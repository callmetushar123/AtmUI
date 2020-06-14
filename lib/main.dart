import 'package:atmui/Phone.dart';
import 'package:atmui/StartPage.dart';
import 'package:atmui/menu.dart';
import 'package:atmui/withdraw.dart';
import 'Phone.dart';
import 'package:flutter/material.dart';

import 'deposit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Menu.id,
      routes: {
        StartPage.id: (context) => StartPage(),
        Phone.id: (context) => Phone(),
        Menu.id: (context) => Menu(),
        Withdraw.id: (context) => Withdraw(),
        Deposit.id: (context) => Deposit()
      },
    );
  }
}
