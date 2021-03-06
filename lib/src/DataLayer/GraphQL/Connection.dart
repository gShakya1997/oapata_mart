import 'package:graphql_flutter/graphql_flutter.dart';

import '../../constants.dart';

final HttpLink httpLink = HttpLink(uri: url);

GraphQLClient clientToQuery() {
  return GraphQLClient(
    cache: InMemoryCache(),
    link: httpLink,
  );
}
