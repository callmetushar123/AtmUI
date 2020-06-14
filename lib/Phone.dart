import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:atmui/menu.dart';

class Phone extends StatefulWidget {
  static const String id = "Phone";
  @override
  _PhoneState createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();

  Future<bool> LoginUser(String phone, BuildContext context) async {
    try {
      _auth.verifyPhoneNumber(
          phoneNumber: "+91" + phone,
          timeout: Duration(seconds: 10),
          verificationCompleted: (AuthCredential credential) async {
            Navigator.of(context).pop(); // to disable the pop up window.

            AuthResult result = await _auth.signInWithCredential(credential);
            FirebaseUser user = result.user;
            try {
              if (user != null) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Menu()));
              }
            } catch (e) {
              print(e);
            }
          },
          verificationFailed: (AuthException exception) {
            print(exception);
          },
          codeSent: (String verificationId, [int forceResendingToken]) async {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return AlertDialog(
                    title: Text("OTP"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(
                          controller: _otpController,
                        )
                      ],
                    ),
                    actions: <Widget>[
                      Opacity(
                          opacity: 0.7,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Material(
                              elevation: 5,
                              color: Color(0xFF311b92),
                              //color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0),
                              child: MaterialButton(
                                onPressed: () async {
                                  final code = _otpController.text.trim();
                                  AuthCredential credential =
                                      PhoneAuthProvider.getCredential(
                                          verificationId: verificationId,
                                          smsCode: code);
                                  AuthResult result = await _auth
                                      .signInWithCredential(credential);
                                  FirebaseUser user = result.user;
                                  try {
                                    if (user != null) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  Menu()));
                                    }
                                  } catch (e) {
                                    print(e);
                                  }
                                },
                                child: Center(
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
                          )),
                    ],
                    //shape: RoundedRectangleBorder(),
                    elevation: 24.0,
                  );
                });
          },
          codeAutoRetrievalTimeout: null);
    } catch (e) {
      print(e);
    }
  }

  String aText = 'Loop';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: <Widget>[
              FlareActor(
                'Animation/Splash7.flr',
                animation: aText,
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
                      controller: _phoneController,
                      style: TextStyle(
                        height: 1.5, //height of the cursor
                      ),
                      decoration: InputDecoration(
                        hintText: "Enter Your Phone No",
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
                              BorderSide(color: Colors.blueAccent, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
//                  Container(
//                    margin: EdgeInsets.symmetric(horizontal: 10),
//                    child: TextField(
//                      style: TextStyle(
//                        height: 1.5, //height of the cursor
//                      ),
//                      keyboardType: TextInputType.number,
//                      obscureText: true,
//                      onChanged: (value) {},
//                      decoration: InputDecoration(
//                        hintText: "Enter Your Pin",
//                        hintStyle: TextStyle(
//                          fontSize: 20,
//                          color: Colors.white,
//                          fontStyle: FontStyle.italic,
//                        ),
//                        contentPadding: EdgeInsets.symmetric(
//                          vertical: 10,
//                          horizontal: 20,
//                        ),
//                        border: OutlineInputBorder(
//                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                        ),
//                        enabledBorder: OutlineInputBorder(
//                          borderSide:
//                              BorderSide(color: Colors.blueAccent, width: 1.0),
//                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                        ),
//                        focusedBorder: OutlineInputBorder(
//                          borderSide:
//                              BorderSide(color: Colors.blueAccent, width: 2.0),
//                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                        ),
//                      ),
//                    ),
//                  ),
//                  SizedBox(
//                    height: 20,
//                  ),
                  Opacity(
                    opacity: 0.7,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Material(
                        elevation: 5,
                        color: Color(0xFF311b92),
                        //color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        child: MaterialButton(
                          onPressed: () {
                            LoginUser(_phoneController.text.trim(), context);
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
}
