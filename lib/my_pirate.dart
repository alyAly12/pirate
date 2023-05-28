import 'dart:math';

import 'package:flutter/material.dart';
import 'package:super_pirate/globals/globals.dart';

class MyPirate extends StatelessWidget {
  const MyPirate({Key? key, this.direction, this.midRun,this.size}) : super(key: key);
final direction;
final midRun;
final  size;
  @override
  Widget build(BuildContext context) {
    if(direction == 'right'){
      return SizedBox(
        width: size,
        height: size,
        child: midRun?Image.asset(Globals.pirateSprite):Image.asset(Globals.pirateRun),
      );
    }else{
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: SizedBox(
          width: size,
          height: size,
          child: midRun?Image.asset(Globals.pirateSprite):Image.asset(Globals.pirateRun),
        ),
      );
    }
  }
}
