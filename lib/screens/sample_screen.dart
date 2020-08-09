import 'package:flutter/material.dart';
import 'package:uzotex_blind/widgets/sample_blinds_carousel.dart';
import 'package:uzotex_blind/widgets/booking_form.dart';

class SampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Available Blinds'),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          SampleBlindsCarousel(),
          BookingForm(),
        ],
      ),
    );
  }
}
