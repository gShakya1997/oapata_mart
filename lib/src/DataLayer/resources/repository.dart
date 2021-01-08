import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:oapata_mart/src/DataLayer/GraphQL/Connection.dart';
import 'package:oapata_mart/src/DataLayer/GraphQL/Queries.dart';
import 'package:oapata_mart/src/DataLayer/models/category.dart';
import 'package:oapata_mart/src/DataLayer/models/product.dart';
import 'package:oapata_mart/src/DataLayer/models/quantiyPrice.dart';
import 'package:oapata_mart/src/DataLayer/models/supplier.dart';

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
          List<dynamic> images = element["image"];

          //Suppliers
          var suppliers = Supplier(
            id: element["supplier"]["id"],
            name: element["supplier"]["name"],
          );

          //Quantity Prices
          var quantiyPrices = QuantiyPrice(
            from: element["quantiyPrice"][0]["from"],
            to: element["quantiyPrice"][0]["to"],
            price: element["quantiyPrice"][0]["price"],
          );

          products.add(
            Product(
              id: element["id"],
              name: element["name"],
              slug: element["slug"],
              supplier: suppliers,
              description: element["description"],
              image: images,
              moq: element["moq"],
              unit: element["unit"],
              quantiyPrice: quantiyPrices,
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
