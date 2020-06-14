import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:atmui/Phone.dart';

class StartPage extends StatefulWidget {
  static const String id = 'StartPage';
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage>
    with SingleTickerProviderStateMixin {
  AnimationController aniController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          child: Stack(
        children: <Widget>[
          FlareActor(
            'Animation/Splash10.flr',
            animation: 'Start', //Sun Rotate
            fit: BoxFit.none,
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              Container(
                child: Center(
                  child: Text(
                    'AEC Bank',
                    style: TextStyle(
                        fontFamily: 'Rounded',
                        color: Colors.white,
                        fontSize: 60),
                  ),
                ),
              ),
              Center(
                child: Container(
                  //width: double.infinity,
                  child: Text(
                    '4 din me paisa double',
                    style: TextStyle(
                        fontFamily: 'Rounded',
                        color: Colors.white,
                        fontSize: 30),
                  ),
                ),
              ),
              SizedBox(
                height: 300,
              ),
              Column(
                //mainAxisAlignment: MainAxisAlignment.end, doesn't work because it is a stack
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 50),
                      child: Material(
                        elevation: aniController.value * 5,
                        color: Color(0xFF311b92),
                        //color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Phone()));
                          },
                          minWidth: aniController.value * 250.0,
                          height: aniController.value * 42.0,
                          child: Text(
                            "Enter",
                            style: TextStyle(
                                fontFamily: 'Rounded',
                                fontSize: aniController.value * 20,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      )),
    );
  }
}
