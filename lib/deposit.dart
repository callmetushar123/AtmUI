import 'package:firebase_database/firebase_database.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:atmui/DepositBalanceProcess.dart';

class Deposit extends StatefulWidget {
  static const String id = "Deposit";
  @override
  _DepositState createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
  int currentBalance;
  final _amtController = TextEditingController();
  final dbRef = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(244, 229, 232, 1),
        body: Container(
          child: Stack(
            children: <Widget>[
              FlareActor(
                'Animation/Splash10.flr',
                animation: "Start",
                fit: BoxFit.cover,
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _amtController,
                      style: TextStyle(
                        height: 1.5, //height of the cursor
                      ),
                      decoration: InputDecoration(
                        hintText: "₹  Enter the Amount to Deposit",
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.teal, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.teal, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Opacity(
                    opacity: 0.7,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Material(
                        elevation: 5,
                        color: Color.fromRGBO(14, 197, 207, 0.9),
                        //color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        child: MaterialButton(
                          onPressed: () {
                            cal();
                          },
                          minWidth: 250.0,
                          height: 42.0,
                          child: Text(
                            "Enter",
                            style: TextStyle(
                                fontFamily: 'Rounded',
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void updateData() async {
    await dbRef.child("1").update({
      "balance": currentBalance,
    });
    print(currentBalance);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => DepositBalanceProcess()));
  }

  void readData() async {
    await dbRef.child("1").once().then((DataSnapshot dataSnapShot) async {
      currentBalance = await dataSnapShot.value["balance"];

//      print(dataSnapShot.value["balance"]);
      print(currentBalance);
    });
  }

  void cal() {
    currentBalance += int.parse(_amtController.text);
    updateData();
  }
}
