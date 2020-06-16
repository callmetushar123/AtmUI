import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:atmui/StartPage.dart';

class Error extends StatefulWidget {
  @override
  _ErrorState createState() => _ErrorState();
}

class _ErrorState extends State<Error> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: Stack(
//            fit: StackFit.expand,
            children: <Widget>[
              FlareActor(
                'Animation/Splash10.flr',
                animation: "Start",
                fit: BoxFit.cover,
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.purpleAccent,
                        Color.fromRGBO(59, 131, 219, 0.1)
                      ]),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "You Don't Have Sufficient Balance to Withdraw :(",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.4,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "SORRY",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Align(
                alignment: Alignment.center,
                child: Row(
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      StartPage()));
                        },
                        minWidth: 190.0,
                        height: 30.0,
                        child: Text(
                          "Exit",

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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
