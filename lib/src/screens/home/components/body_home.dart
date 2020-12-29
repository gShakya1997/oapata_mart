import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:oapata_mart/src/config/api.dart';
import 'package:oapata_mart/src/constants.dart';

class BodyHome extends StatelessWidget {
  // final List<String> categories = [
  //   'Clothing',
  //   'Vechiles & Accessories',
  //   'Consumer Electronics',
  //   'Tools & Hardware',
  //   'Machinery',
  //   'Luggage, Bags & Cases',
  // ];
  // int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [
          _search(),
          SizedBox(height: 10.0),
          _buildCategories(),
        ],
      ),
    );
  }
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
                                  color: kPrimaryLightColor, width: 5),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
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
