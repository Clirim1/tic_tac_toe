import 'package:flutter/material.dart';

class Game_Button{
   final id;
   String text;
   Color back_graund;
   bool enable;
  
   Game_Button(
     {this.id, this.text = "",this.back_graund = Colors.grey,this.enable=true}
   );
  
  
  }