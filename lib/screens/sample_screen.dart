import 'package:flutter/material.dart';

class SampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Blinds'),
        backgroundColor: Colors.deepOrange[400],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ListView(
              children: <Widget>[
                // ListView.builder(itemBuilder: null)
                Center(child: Text('I am a chosen one')),
              ],
            )
          ],
        ),),
    );
  }
}