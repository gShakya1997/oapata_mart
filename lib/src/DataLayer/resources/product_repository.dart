import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:oapata_mart/src/DataLayer/GraphQL/Connection.dart';
import 'package:oapata_mart/src/DataLayer/GraphQL/Queries.dart';
import 'package:oapata_mart/src/DataLayer/models/product.dart';
import 'package:oapata_mart/src/DataLayer/models/quantiyPrice.dart';
import 'package:oapata_mart/src/DataLayer/models/supplier.dart';

class ProductRepository {
  GraphQLClient _client = clientToQuery();

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

  Future<Product> fetchProductById(String productId) async {
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql(getProductByIdQuery),
        variables: {
          'id': productId,
        },
      ),
    );

    if (!result.hasException) {
      final data = result.data["getProduct"];
      Product product;

      List<dynamic> images = data["image"];

      //Suppliers
      var suppliers = Supplier(
        id: data["supplier"]["id"],
        name: data["supplier"]["name"],
      );

      //Quantity Prices
      var quantiyPrices = QuantiyPrice(
        from: data["quantiyPrice"][0]["from"],
        to: data["quantiyPrice"][0]["to"],
        price: data["quantiyPrice"][0]["price"],
      );

      product = Product(
        id: data["id"],
        name: data["name"],
        slug: data["slug"],
        supplier: suppliers,
        description: data["description"],
        image: images,
        moq: data["moq"],
        unit: data["unit"],
        quantiyPrice: quantiyPrices,
        discountRate: data["discountRate"],
      );
      return product;
    } else {
      return null;
    }
  }

  //Fetch products by category id
  Future<List<Product>> fetchProductsByCategoryId(String id) async {
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql(getAllProductsQuery),
        variables: {
          'categoryIds': id,
        },
      ),
    );

    if (!result.hasException) {
      List data = result.data["getProducts"];
      List<Product> products = [];
      data.forEach(
        (element) {
          print(element);
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
