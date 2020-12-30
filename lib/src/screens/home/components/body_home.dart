import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:oapata_mart/src/config/api.dart';
import 'package:oapata_mart/src/constants.dart';

class BodyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            _search(),
            _buildCategories(),
            Divider(
              color: kPrimaryColor,
              thickness: 2.0,
            ),
            Text(
              'Deal of the day',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Divider(
              color: kPrimaryColor,
              thickness: 2.0,
            ),
            _productList(),
          ],
        ),
      ),
    );
  }
}

Widget _productList() {
  return Query(
    options: QueryOptions(
      documentNode: gql(getProducts),
      pollInterval: 1,
    ),
    builder: (QueryResult result, {VoidCallback refetch, FetchMore fetchMore}) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(2)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: kPrimaryLightColor,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    color: kPrimaryColor,
                  ),
                  onPressed: () {},
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(
                      'https://s.alicdn.com/@sc01/kf/Hd9e96ec5beda48488fb057bcddfeca19G.jpg_250x250xzq80.jpg',
                      height: 150,
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Rs.2350',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text('1'),
                        Text('-'),
                        Text('100'),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Wireless Mouse',
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
        ),
      );
    },
  );
}

Widget _buildCategories() {
  return Query(
    options: QueryOptions(
      documentNode: gql(getCategories),
      pollInterval: 1,
    ),
    builder: (QueryResult result, {VoidCallback refetch, FetchMore fetchMore}) {
      return Container(
        height: 80.0,
        child: result.hasException
            ? Text(result.exception.toString())
            : result.loading
                ? LinearProgressIndicator(backgroundColor: kPrimaryLightColor)
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: result.data['getCategories'].length,
                      itemBuilder: (context, index) {
                        final category = result.data['getCategories'][index];
                        return Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: kPrimaryLightColor, width: 2),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 10,
                                  spreadRadius: 5,
                                  offset: Offset(5, 5),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image.network('${category['icon']}'),
                                  SizedBox(width: 5.0),
                                  Text(
                                    category['name'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: kTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
      );
    },
  );
}

Widget _search() {
  return Container(
    child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search Products",
                  hintStyle: TextStyle(fontSize: 12),
                  contentPadding:
                      EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
                  prefixIcon: Icon(Icons.search, color: Colors.black54)),
            ),
          ),
        ),
      ],
    ),
  );
}
