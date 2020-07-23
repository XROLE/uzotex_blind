import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uzotex_blind/screens/sample_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(100, 100, 100, 0),
            child: Column(
              children: <Widget>[
                Text(
                  'UZOTEX',
                  style: GoogleFonts.teko(
                    textStyle: TextStyle(
                    fontSize: 25,
                  ),
                  ),
                ),
              ],
              ),
          ), 
          Container(
                  child: Text(
                    'WINDOW BLINDS',
                    style: GoogleFonts.teko(
                      textStyle: TextStyle(
                      fontSize: 33,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 0, 30),
                  child: Container(
                    width: 220,
                    child: Text(
                      'tha sdsjhfsa sfsahsosf a fdsksa hakld adhska  akjhdakh a kh ajshaf'
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: FlatButton(
                  color: Colors.deepOrange[300],
                  padding: EdgeInsets.symmetric(horizontal: 70, vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23),
                  ),
                  child: Text(
                    'Tour', 
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_){
                   return SampleScreen();
    }));
                  },
                ),
          ),
          SizedBox(height: 30,),
          Image(image: AssetImage('assets/images/first.png'),
          ),
          Text('xrole', style:GoogleFonts.teko()),

        ],
      ),
    );
  }
}