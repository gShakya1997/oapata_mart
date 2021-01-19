import 'package:flutter/material.dart';
import 'package:oapata_mart/src/PresentationLayer/screens/dashboard_screen.dart';
import 'package:oapata_mart/src/PresentationLayer/screens/product_detail_screen.dart';

class RoutesGenerator {
  Route generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => DashboardScreen(),
        );
        break;
      case '/productDetailScreen':
        return MaterialPageRoute(
          builder: (_) => ProductDetailScreen(
            productId: args,
          ),
        );
        break;
      default:
        return _errorRoute();
    }
  }

  Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text('ERROR'),
          ),
        );
      },
    );
  }
}
