import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uzotex_blind/service/app-colors.dart';
import 'package:uzotex_blind/service/responsive-height-width.dart';
import 'package:uzotex_blind/widgets/loader.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final documentCategory = ModalRoute.of(context).settings.arguments;

    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('window-blinds')
            .doc(documentCategory)
            .collection(documentCategory)
            .snapshots(),
        builder: (context, snapshots) {
          if (snapshots.hasError) {
            return Center(
              child: Text('Something went Wrong'),
            );
          } else if (snapshots.connectionState == ConnectionState.waiting) {
            return loader(Color(AppColor.primaryColor()), 50);
          }
          List<Container> itemList = snapshots.data.docs.map((doc) {
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                  top: ResponsiveHeigthAndWidth.getHeigth(0.01, 0.05, context)),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color(AppColor.secondaryColor()),
                    width: 1,
                    style: BorderStyle.solid),
              ),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      doc.data()['Id'],
                      style: TextStyle(
                        fontSize: ResponsiveHeigthAndWidth.getHeigth(
                            0.025, 0.05, context),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveHeigthAndWidth.getHeigth(0.01, 0.04, context),
                  ),
                  Container(
                    height:
                        ResponsiveHeigthAndWidth.getHeigth(0.14, 0.4, context),
                    child: doc.data()['Image'] == null
                        ? Center(
                            child: loader(Color(AppColor.primaryColor()), 50))
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image.network(
                              doc.data()['Image'],
                              fit: BoxFit.fitWidth,
                            )),
                  ),
                  SizedBox(
                    height: ResponsiveHeigthAndWidth.getHeigth(0.00, 0.04, context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '#${doc.data()['Price']}',
                        style: TextStyle(fontSize: ResponsiveHeigthAndWidth.getHeigth(0.025, 0.05, context)),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Color(AppColor.secondaryColor()),
                          ),
                          onPressed: () {}),
                    ],
                  ),
                ],
              ),
            );
          }).toList();
          return snapshots.data.docs.length == 0
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Item Finished'),
                      Text('Kindly check other categories'),
                    ],
                  ),
                )
              : GridView.count(
                  primary: false,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 40,
                  crossAxisCount: 2,
                  children: itemList,
                );
        });
  }
}
