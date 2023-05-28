import 'dart:async';
import 'package:flutter/material.dart';
import 'package:super_pirate/globals/globals.dart';
import 'package:super_pirate/jumping_pirate.dart';
import 'package:super_pirate/my_pirate.dart';
import 'package:super_pirate/banana.dart';
import 'package:super_pirate/widgets/my_controlling_buttons.dart';
import 'package:super_pirate/widgets/text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 static double pirateX = 0;
  static double pirateY = 1.22;
 double bananaX = 0.5;
 double bananaY = 1;
  double time = 0;
  double height = 0;
  double initialHeight = pirateY;
  String direction ='right';
  bool midRun =false;
  bool midJump= false;
 late Widget child;
 double pirateSize =130;


 void checkIfAteBanana(){
   if((pirateX-bananaX).abs()<0.3 && (pirateY-bananaY).abs()<0.3){
     setState(() {
       bananaX =2;
       pirateSize =190;
     });
   }
 }

  void preJump(){
    time =0;
    initialHeight = pirateY;
  }

  void jump(){
    //this for disable a double jump
    if(midJump == false){
      midJump =true;
      preJump();
      Timer.periodic(const Duration(milliseconds: 100), (timer) {
        time += 0.05;
        height = -4.9*time*time +5 *time;

        if(initialHeight - height > 1.22){
          midJump =false;
          setState(() {
            pirateY = 1.22;
          });
          timer.cancel();
        }else{
          setState(() {
            pirateY = initialHeight - height;
          });
        }
      });
    }
  }
  void moveRight(){
    direction ='right';
    checkIfAteBanana();
    Timer.periodic(const Duration(milliseconds: 30), (timer) {
      checkIfAteBanana();
      if(const MyButtons().userHoldingButtons()==true){
        setState(() {
          pirateX += 0.02;
          midRun =! midRun;
        });
      }else{
        timer.cancel();
      }
    });
  }
 void moveLeft(){
    direction = 'left';
    checkIfAteBanana();
    Timer.periodic(const Duration(milliseconds: 30), (timer) {
      checkIfAteBanana();
      if(const MyButtons().userHoldingButtons() == true){
        setState(() {
          pirateX -= 0.02;
          midRun =! midRun;
        });
      }else{
        timer.cancel();
      }
    });
 }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
              child: Stack(
                children:[ Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image:AssetImage(Globals.skySprite),fit: BoxFit.fitWidth)
                  ),
                  child: AnimatedContainer(
                    alignment: Alignment(pirateX,pirateY),
                      duration:const Duration(milliseconds: 0),
                    child: midJump? JumpingPirate(
                      direction: direction,
                    ):MyPirate(
                      direction: direction,
                      midRun: midRun,
                      size: pirateSize,
                    ),
                  ),
                ),
                  Container(
                    alignment:  Alignment(bananaX,bananaY),
                    child:const Banana() ,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                         Column(
                          children: [
                          TextWidget(title: 'Pirate'),
                            SizedBox(height: 8,),
                            TextWidget(title: '0000')
                          ],
                        ),
                         Column(
                          children: [
                            TextWidget(title: 'Level'),
                            SizedBox(height: 8,),
                            TextWidget(title: '1-1')
                          ],
                        ),
                        Column(
                          children: [
                            TextWidget(title: 'Time'),
                            SizedBox(height: 8,),
                            TextWidget(title: '9999')
                          ],
                        ),
                      ],
                    ),
                  )
              ])
          ),
          Expanded(
            flex: 1,
              child: Container(
               color: Colors.brown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MyButtons( onTap: moveLeft,icon: Icons.arrow_back,),
                    MyButtons(onTap:jump,  icon: Icons.arrow_upward,),
                     MyButtons(onTap: moveRight, icon: Icons.arrow_forward,)
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}
