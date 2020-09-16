import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uzotex_blind/models/product.dart';
import 'package:uzotex_blind/service/app-colors.dart';
import 'package:uzotex_blind/widgets/add-unit.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Blood').snapshots(),
        builder: (context, snapshots) {
          return Container(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(25),
              crossAxisSpacing: 30,
              mainAxisSpacing: 40,
              crossAxisCount: 2,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(
                          0,
                          0,
                        ),
                        blurRadius: 1.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.network(
                            'https://tse4.mm.bing.net/th?id=OIP.Vd6wfBvjNsi3op__H6-icwHaFm&pid=Api&P=0&w=240&h=183'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '#7399',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(AppColor.secondaryColor()),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Image.network(
                      'https://tse4.mm.bing.net/th?id=OIP.Vd6wfBvjNsi3op__H6-icwHaFm&pid=Api&P=0&w=240&h=183'),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(
                          0,
                          0,
                        ),
                        blurRadius: 1.0,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text('I am a chosen one'),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(
                          0,
                          0,
                        ),
                        blurRadius: 1.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
