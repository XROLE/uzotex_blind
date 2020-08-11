import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uzotex_blind/screens/sample_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: 80),
                Text(
                  'UZOTEX',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.teko(
                    textStyle: TextStyle(
                    fontSize: 25,
                  ),
                  ),
                ),
              ],
              ), 
            Text(
              'WINDOW BLINDS',
              textAlign: TextAlign.center,
              style: GoogleFonts.teko(
                textStyle: TextStyle(
                fontSize: 33,
                ),
              ),
            ),
            SizedBox(height: 20),
          Align(
              child: Container(
                width: 250,
              child: Text(
                'tha sdsjhfsa sfsahsosf a fdsksa hakld adhska  akjhdakh a kh ajshaf',
              ),
            ),
          ),
          SizedBox(height: 20),
          Align(
            child: Container(
            width: 300,
            child: FlatButton(
              color: Colors.deepOrange[400],
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
        ),
            Image(image: AssetImage('assets/images/first.png'),
            ),
            Center(child: Text('xrole', style:GoogleFonts.teko())),
          ],
        ),
      ),
    );
  }
}