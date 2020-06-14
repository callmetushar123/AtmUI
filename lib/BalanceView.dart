import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class BalanceView extends StatefulWidget {
  @override
  _BalanceViewState createState() => _BalanceViewState();
}

class _BalanceViewState extends State<BalanceView> {
  int currentBalance;

  final dbRef = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: readData(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return Center(
                  child: Text(currentBalance.toString()),
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
      currentBalance = await dataSnapShot.value["balance"];
      print(currentBalance);
    });
    return currentBalance;
  }
}
