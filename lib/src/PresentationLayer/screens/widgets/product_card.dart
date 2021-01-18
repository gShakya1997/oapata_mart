import 'package:flutter/material.dart';

import 'package:oapata_mart/src/constants.dart';

class ProductCard extends StatelessWidget {
  final String productImageLink;
  final dynamic productPrice;
  final int productFrom;
  final int productTo;
  final String productName;

  const ProductCard({
    Key key,
    @required this.productImageLink,
    @required this.productPrice,
    @required this.productFrom,
    @required this.productTo,
    @required this.productName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 10,
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          border: Border.all(color: kPrimaryColor),
        ),
        child: Column(
          children: [
            IconButton(
              icon: Icon(
                Icons.favorite_border_outlined,
                color: kPrimaryColor,
              ),
              onPressed: () {},
            ),
            Container(
              width: 150,
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(
                    productImageLink,
                    height: 100,
                  ),
                  SizedBox(height: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Rs.$productPrice',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '$productFrom',
                          ),
                          Text(' - '),
                          Text(
                            '$productTo',
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        '$productName',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
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
