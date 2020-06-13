import 'package:atmui/menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Pin extends StatefulWidget {
  static const String id = "Pin";
  final String phoneno;
  Pin({this.phoneno});

  @override
  _PinState createState() => _PinState();
}

class _PinState extends State<Pin> with SingleTickerProviderStateMixin {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String pin;
  int flag = 0;

  Future<bool> LoginUser(String phone) async {
    try {
      _auth.verifyPhoneNumber(
          phoneNumber: phone,
          timeout: Duration(seconds: 60),
          verificationCompleted: null,
//          (AuthCredential credential) async {
//            AuthResult result = await _auth.signInWithCredential(credential);
//            FirebaseUser user = result.user;
//            try {
//              if (user != null) {
//                setState(() {
//                  aText = "success";
//                });
//                Navigator.pushReplacement(
//                    context,
//                    MaterialPageRoute(
//                        builder: (BuildContext context) => Menu()));
//              }
//            } catch (e) {
//              print(e);
//            }
//          },
          verificationFailed: (AuthException exception) {
            print(exception);
          },
          codeSent: (String verificationId, [int forceResendingToken]) async {
            AuthResult result;
            AuthCredential credential = PhoneAuthProvider.getCredential(
                verificationId: verificationId, smsCode: pin.trim());
            result = await _auth.signInWithCredential(credential);

            FirebaseUser user = result.user;
            print("This step is completed");
            if (user != null) {
              setState(() {
                aText = "success";
              });
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext context) => Menu()));
            }
          },
          codeAutoRetrievalTimeout: null);
    } catch (e) {
      print(e);
    }
  }

  AnimationController aniController;
  String aText = 'idle';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoginUser(widget.phoneno);
    aniController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    aniController.forward();

    aniController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    aniController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //String userPhone = widget.phoneno;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: <Widget>[
              FlareActor(
                'Animation/login.flr',
                animation: aText,
                fit: BoxFit.cover,
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
//                  SizedBox(
//                    height: 20,
//                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      style: TextStyle(
                        height: 1.5, //height of the cursor
                      ),
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      onChanged: (value) {
                        pin = value;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter Your Pin",
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
                            setState(() {
                              flag++;
                            });
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
