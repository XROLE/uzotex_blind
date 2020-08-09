import 'package:flutter/material.dart';
import 'package:uzotex_blind/models/blinds_model.dart';

class SampleBlindsCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 200,
        width: double.infinity,
        child: ListView.builder(
          itemCount: blinds.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            Blinds sample = blinds[index];
            return Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 0.2),
                        blurRadius: 6.0)
                  ],
                  borderRadius: BorderRadius.circular(10.0)),
              height: 30,
              width: 210,
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.all(10),
              child: Image(
                height: 18.0,
                width: 180.0,
                image: AssetImage(sample.imageUrl),
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
