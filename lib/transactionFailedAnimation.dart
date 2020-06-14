import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'Error.dart';

class TFA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: FlareActor(
          'Animation/sperror.flr',
          animation: 'error',
          fit: BoxFit.contain,
          callback: (String yo) {
            print(yo);
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) => Error()));
          },
        ),
      ),
    );
  }
}
