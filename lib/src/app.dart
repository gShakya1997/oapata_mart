import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:oapata_mart/src/config/api.dart';
import 'package:oapata_mart/src/config/routeGenerator.dart';
import 'package:oapata_mart/src/constants.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Oapata Mart',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        ),
        initialRoute: '/',
        onGenerateRoute: RoutesGenerator.generateRoute,
      ),
    );
  }
}
