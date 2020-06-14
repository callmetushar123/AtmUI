import 'package:atmui/BalanceView.dart';
import 'package:atmui/withdraw.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'deposit.dart';

class Menu extends StatefulWidget {
  static const String id = "Menu";
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              FlareActor(
                'Animation/Splash7.flr',
                animation: "Loop",
                fit: BoxFit.cover,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Center(
                    child: Material(
                      elevation: 5,
                      color: Color(0xFF311b92),
                      //color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      BalanceView()));
                        },
                        minWidth: 250.0,
                        height: 80.0,
                        child: Text(
                          "Check Balance",
                          style: TextStyle(
                              fontFamily: 'Rounded',
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Material(
                      elevation: 5,
                      color: Color(0xFF311b92),
                      //color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Withdraw()));
                        },
                        minWidth: 250.0,
                        height: 80.0,
                        child: Text(
                          "Withdraw",
                          style: TextStyle(
                              fontFamily: 'Rounded',
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Material(
                      elevation: 5,
                      color: Color(0xFF311b92),
                      //color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Deposit()));
                        },
                        minWidth: 250.0,
                        height: 80.0,
                        child: Text(
                          "Deposit",
                          style: TextStyle(
                              fontFamily: 'Rounded',
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
