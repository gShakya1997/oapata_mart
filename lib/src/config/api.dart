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
query GetCategories{
  getCategories{
    id
    name
    slug
    backgroundImg
    icon 
  }
}
""";

final String getProducts = """
query GetProducts(\$categoryIds:[ID]){
    getProducts(categoryIds:\$categoryIds){
      id
      name
      slug
      supplier{
        id
        name
      }
      categories{
        id
        name
      }
      description
      image
      moq
      unit
      quantiyPrice{
        from
        to
        price
      }
      discountRate
      customAttribute{
        key
        value
      }
      variation{
        key
        value
      }
    }
  }
""";
