import 'package:firebase_database/firebase_database.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

import 'WithdrawBalanceView.dart';

class WithdrawBalanceProcess extends StatefulWidget {
  @override
  _WithdrawBalanceProcessState createState() => _WithdrawBalanceProcessState();
}

class _WithdrawBalanceProcessState extends State<WithdrawBalanceProcess> {
  int currentBalance;
  String userName;
  int cardNo;

  final dbRef = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: readData(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return Container(
                  child: FlareActor(
                    'Animation/Success.flr',
                    animation: 'Start',
                    fit: BoxFit.none,
                    callback: (String yo) {
                      print(yo);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  WithdrawBalanceView(
                                    cardNo: cardNo,
                                    currentBalance: currentBalance,
                                    userName: userName,
                                  )));
                    },
                  ),
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Future<int> readData() async {
    await dbRef.child("1").once().then((DataSnapshot dataSnapShot) async {
      var temp = await dataSnapShot.value;
      userName = temp["name"];
      currentBalance = temp["balance"];
      cardNo = temp["cardno"];
      print(currentBalance);
    });
    return currentBalance;
  }
}
