import 'package:atmui/DepositBalanceView.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class DepositBalanceProcess extends StatefulWidget {
  @override
  _DepositBalanceProcessState createState() => _DepositBalanceProcessState();
}

class _DepositBalanceProcessState extends State<DepositBalanceProcess> {
  int currentBalance;
  String userName;
  int cardNo;

  final dbRef = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
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
                    //this callback works only if the animation is not in a loop.
                    print(yo);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                DepositeBalanceView(
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

//return Column(
//mainAxisAlignment: MainAxisAlignment.center,
//children: <Widget>[
//Padding(
//padding: EdgeInsets.only(left: 20, top: 10),
//child: Row(
//children: <Widget>[
//SizedBox(
//width: 80,
//height: 60,
//),
//SizedBox(
//width: 20,
//),
//Column(
//crossAxisAlignment: CrossAxisAlignment.start,
//children: <Widget>[
//Text(
//"Hi,",
//style: TextStyle(
//fontSize: 13,
//fontWeight: FontWeight.w900,
//color: Colors.white),
//),
//Text(
//userName.toString(),
//style: TextStyle(
//fontSize: 24,
//color: Colors.white,
//fontWeight: FontWeight.w600),
//),
//],
//),
//],
//)),
//Padding(
//padding: EdgeInsets.only(
//left: 20, top: 20, right: 20, bottom: 20),
//child: Container(
//height: 150,
//decoration: BoxDecoration(
//gradient: LinearGradient(colors: [
//Colors.blueGrey,
//Color.fromRGBO(41, 69, 93, 0.4)
//]),
//borderRadius: BorderRadius.all(Radius.circular(20))),
//child: Center(
//child: Column(
//mainAxisAlignment: MainAxisAlignment.center,
//children: <Widget>[
//Text(
//"Your Balance Amount is",
//style: TextStyle(
//fontWeight: FontWeight.bold,
//color: Colors.white),
//),
//Text(
//"\₹ " + currentBalance.toString(),
//style:
//TextStyle(color: Colors.white, fontSize: 42),
//),
//],
//),
//),
//),
//),
//Text(
//"STATEMENT FOR YOUR CARD " + cardNo.toString(),
//style: TextStyle(
//fontWeight: FontWeight.bold, color: Colors.white),
//),
//Expanded(
//child: ListView.builder(
//itemBuilder: (BuildContext context, int index) {
//return Padding(
//padding:
//EdgeInsets.only(left: 20, right: 20, top: 10),
//child: Container(
//decoration: BoxDecoration(
//borderRadius:
//BorderRadius.all(Radius.circular(10)),
//color: Color.fromRGBO(60, 63, 65, 0.6),
//),
//child: ListTile(
//title: Text(
//"Transaction $index",
//style: TextStyle(
//fontWeight: FontWeight.bold,
//color: Colors.white),
//),
//subtitle: Text(
//"Some brief detail of transaction no $index",
//style: TextStyle(color: Colors.white),
//),
//contentPadding: EdgeInsets.only(
//left: 16, right: 16, top: 5, bottom: 5),
//trailing: Text(
//"DEBIT",
//style: TextStyle(
//fontWeight: FontWeight.bold,
//color: Colors.greenAccent),
//),
//),
//),
//);
//},
//),
//)
//],
//);
