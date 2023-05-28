import 'dart:math';

import 'package:flutter/material.dart';
import 'package:super_pirate/globals/globals.dart';

class JumpingPirate extends StatelessWidget {
  const JumpingPirate({Key? key, this.direction}) : super(key: key);
final direction;
  @override
  Widget build(BuildContext context) {
    if(direction == 'right'){
      return SizedBox(
        height:130 ,
        width: 130,
        child: Image.asset(Globals.pirateJump),
      );
    }else{
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: SizedBox(
          height:130 ,
          width: 130,
          child: Image.asset(Globals.pirateJump),
        ),
      );
    }
  }
}
