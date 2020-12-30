import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../constants.dart';

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: InMemoryCache(),
    link: HttpLink(uri: url),
  ),
);

final String getCategories = """
query{
  getCategories{
    id,
    name,
    icon
  }
}
""";

final String getProducts = """
query{
  getProducts{
    id
    name
    image
    description
    quantiyPrice{
      from
      to
      price
    }
  }
}
""";
