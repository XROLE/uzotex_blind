import 'package:flutter/material.dart';


class BookingForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SizedBox(height: 10.0),
          TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              helperText: 'Do ensure to provide a valid email',
              labelStyle: TextStyle(color: Colors.black),
              contentPadding: EdgeInsets.symmetric(vertical: 10.0),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange[400]),
              ),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              labelText: 'ID',
              helperText: 'Check blind sample for ID',
              labelStyle: TextStyle(color: Colors.black),
              contentPadding: EdgeInsets.symmetric(vertical: 10.0),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange[400])
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            height: 40.0,
            decoration: BoxDecoration(
             color: Colors.deepOrange[400],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              width: double.infinity,
              child: Center(child: Text('Send Booking', style: TextStyle(color: Colors.white),)),
            ),
          ),
        ],
      ),
    );
  }
}
