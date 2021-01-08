import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oapata_mart/src/BLL/blocs/product_bloc/product_bloc.dart';
import 'package:oapata_mart/src/DataLayer/resources/repository.dart';
import 'package:oapata_mart/src/constants.dart';

import 'BLL/blocs/category_bloc/category_bloc.dart';
import 'PresentationLayer/config/routeGenerator.dart';

class App extends StatelessWidget {
  final RoutesGenerator routesGenerator;
  final Repository repository;

  const App({
    Key key,
    this.routesGenerator,
    this.repository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryBloc>(
          create: (context) =>
              CategoryBloc(repository: repository)..add(AppStarted()),
        ),
        BlocProvider<ProductBloc>(
          create: (context) =>
              ProductBloc(repository: repository)..add(CategoryLoaded()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Oapata Mart',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        ),
        initialRoute: '/',
        onGenerateRoute: routesGenerator.generateRoute,
      ),
    );
  }
}
