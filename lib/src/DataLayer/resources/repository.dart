import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:oapata_mart/src/DataLayer/GraphQL/Connection.dart';
import 'package:oapata_mart/src/DataLayer/GraphQL/Queries.dart';
import 'package:oapata_mart/src/DataLayer/models/category.dart';

class Repository {
  GraphQLClient _client = clientToQuery();

  Future<List<Category>> fetchAllCategory() async {
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql(getCategoriesQuery),
      ),
    );

    if (!result.hasException) {
      List data = result.data["getCategories"];
      List<Category> categories = [];
      data.forEach(
        (element) {
          categories.add(
            Category(
              id: element["id"],
              name: element["name"],
              backgroundImg: element["backgroundImg"],
              icon: element["icon"],
              slug: element["slug"],
            ),
          );
        },
      );
      return categories;
    } else {
      return null;
    }
  }
}
