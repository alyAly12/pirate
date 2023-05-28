import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
   const MyButtons({Key? key, this.icon,  this.onTap}) : super(key: key);
  final IconData? icon;
  final  Function? onTap;
 static  bool holdingButtons = false;

   bool userHoldingButtons(){
     return holdingButtons;
   }
  @override
  Widget build(BuildContext context) {


    return GestureDetector(
     onTapDown: (details){
       holdingButtons=true;
       onTap!();
     },
      onTapUp: (details){
       holdingButtons = false;
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.brown[300],
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
