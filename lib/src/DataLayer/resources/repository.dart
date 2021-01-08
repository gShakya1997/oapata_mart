import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:oapata_mart/src/DataLayer/GraphQL/Connection.dart';
import 'package:oapata_mart/src/DataLayer/GraphQL/Queries.dart';
import 'package:oapata_mart/src/DataLayer/models/category.dart';
import 'package:oapata_mart/src/DataLayer/models/product.dart';

class Repository {
  GraphQLClient _client = clientToQuery();

  //Fetch all category
  Future<List<Category>> fetchAllCategories() async {
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql(getAllCategoriesQuery),
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

  //Fetch all products
  Future<List<Product>> fetchAllProducts() async {
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql(getAllProductsQuery),
      ),
    );

    if (!result.hasException) {
      List data = result.data["getProducts"];
      List<Product> products = [];
      data.forEach(
        (element) {
          products.add(
            Product(
              id: element["id"],
              name: element["name"],
              slug: element["slug"],
              supplier: element["supplier"],
              categoryList: element["categoryList"],
              description: element["description"],
              image: element["image"],
              moq: element["moq"],
              unit: element["unit"],
              quantiyValue: element["quantiyValue"],
              discountRate: element["discountRate"],
            ),
          );
        },
      );
      return products;
    } else {
      return null;
    }
  }
}
