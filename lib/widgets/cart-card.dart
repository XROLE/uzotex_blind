import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uzotex_blind/block/cart_bloc.dart';
import 'package:uzotex_blind/screens/order-page.dart';
import 'package:uzotex_blind/service/app-colors.dart';
import 'package:uzotex_blind/service/responsive-height-width.dart';

class CartCard extends StatefulWidget {
  final String id;
  final String price;
  final int numWin;
  final int total;
  final String image;

  CartCard(
      {@required this.image,
      @required this.id,
      @required this.price,
      @required this.numWin,
      @required this.total});

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    final CartBloc cartBloc = Provider.of<CartBloc>(context);

    return Card(
      child: Container(
        height: ResponsiveHeigthAndWidth.getHeigth(0.22, 0.36, context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: ResponsiveHeigthAndWidth.getHeigth(0.18, 0.36, context),
              child: Image.network(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: ResponsiveHeigthAndWidth.getWidth(0.36, 0.36, context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: ResponsiveHeigthAndWidth.getHeigth(
                              0.015, 0.03, context),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.id,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ]),
                        SizedBox(
                          height: ResponsiveHeigthAndWidth.getHeigth(
                              0.007, 0.007, context),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {},
                            ),
                            SizedBox(
                              width: ResponsiveHeigthAndWidth.getWidth(
                                  0.07, 0.05, context),
                            ),
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(
                          height: ResponsiveHeigthAndWidth.getHeigth(
                              0.007, 0.007, context),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              color: Color(AppColor.primaryColor()),
                              child: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  cartBloc.deleteCartItem(widget.id);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Orders()));
                                },
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: ResponsiveHeigthAndWidth.getWidth(
                                  0.04, 0.03, context),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              color: Color(AppColor.secondaryColor()),
                              child: IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {},
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: ResponsiveHeigthAndWidth.getWidth(0.2, 0.2, context),
              child: Column(
                children: [
                  SizedBox(
                    height:
                        ResponsiveHeigthAndWidth.getHeigth(0.02, 0.04, context),
                  ),
                  Text('# ${widget.price}',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(
                    height:
                        ResponsiveHeigthAndWidth.getHeigth(0.04, 0.06, context),
                  ),
                  Text(
                    '${widget.numWin}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height:
                        ResponsiveHeigthAndWidth.getHeigth(0.04, 0.08, context),
                  ),
                  Text(
                    '# ${widget.total}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
