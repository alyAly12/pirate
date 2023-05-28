import 'package:flutter/material.dart';
import 'package:super_pirate/globals/globals.dart';

class Banana extends StatelessWidget {
  const Banana({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 45,
      child: Image.asset(Globals.banana),
    );
  }
}
