import 'package:flutter/material.dart';
import 'package:uzotex_blind/widgets/sample_blinds_carousel.dart';
import 'package:uzotex_blind/widgets/booking_form.dart';

class SampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Blinds'),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: InkWell(
              splashColor: Colors.transparent,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              child: ListView(
                 children: <Widget>[
                 SampleBlindsCarousel(),
                 BookingForm(),
        ],
        ),
      ),
    );
  }
}
