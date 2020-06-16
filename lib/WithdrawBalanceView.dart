import 'package:flutter/material.dart';
import 'package:atmui/menu.dart';

class WithdrawBalanceView extends StatelessWidget {
  final int currentBalance;
  final String userName;
  final int cardNo;
  WithdrawBalanceView({this.currentBalance, this.cardNo, this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(50, 125, 219, 0.3),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 80,
                      height: 60,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Hi,",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                        Text(
                          userName.toString(),
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                )),
            Padding(
              padding:
                  EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.purple,
                      Color.fromRGBO(59, 131, 219, 0.3),
                    ]),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Your Balance Amount is",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(
                        "\₹ " + currentBalance.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 42),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 148,
                ),
                Material(
                  elevation: 5,

                  color: Color.fromRGBO(199, 199, 228, 0.6),
                  //color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    minWidth: 190.0,
                    height: 30.0,
                    child: Text(
                      "Go Back",

                      style: TextStyle(
                          fontFamily: 'Rounded',
                          fontSize: 20,
                          color: Colors.white),
                    ),


                  ),
                ),
              ],

//
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "STATEMENT FOR YOUR CARD " + cardNo.toString(),
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromRGBO(60, 63, 65, 0.6),
                      ),
                      child: ListTile(
                        title: Text(
                          "Transaction ${index + 1}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        subtitle: Text(
                          "Some brief detail of transaction no ${index + 1}",
                          style: TextStyle(color: Colors.white),
                        ),
                        contentPadding: EdgeInsets.only(
                            left: 16, right: 16, top: 5, bottom: 5),
                        trailing: Text(
                          "DEBIT",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.greenAccent),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
