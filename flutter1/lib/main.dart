import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter1/constants/colors.dart';

void main() {
  runApp(const OurWidget());
}

class OurWidget extends StatefulWidget {
  const OurWidget({super.key});

  @override
  State<OurWidget> createState() => _OurWidgetState();
}

class _OurWidgetState extends State<OurWidget> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.abelTextTheme()),
      home:Row(
        children: [
          Flexible(
            
            child: Container(
              child: Text("merhabaasd"),
              color:Colors.blue
            ),
          ),
          Flexible(
            child:Container(
             
               color:Colors.white,
               child: Text("merhad"),
            ),
          ),
        ]
          
      )
        
      
    );
  }
}
