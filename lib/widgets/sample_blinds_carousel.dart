import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uzotex_blind/models/blinds_model.dart';
import 'package:uzotex_blind/service/responsive-height-width.dart';

class SampleBlindsCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final blindsCategories = Provider.of<List<Category>>(context);
    
    return Container(
      height: ResponsiveHeigthAndWidth.getHeigth(0.36, 0.6, context),
      child: ListView.builder(
        itemCount: blindsCategories.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          Category sample = blindsCategories[index];
          return Container(
            width: ResponsiveHeigthAndWidth.getWidth(0.5, 0.6, context),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
            margin: EdgeInsets.symmetric(
                horizontal:
                    ResponsiveHeigthAndWidth.getWidth(0.04, 0.02, context)),
            padding: EdgeInsets.symmetric(vertical: 7),
            child: Column(
              children: [
                Container(
                  height:
                      ResponsiveHeigthAndWidth.getHeigth(0.27, 0.49, context),
                  child: Image.network(
                    sample.image,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Center(
                  child: Text(
                    sample.name,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
