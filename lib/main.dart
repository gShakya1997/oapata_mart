import 'package:flutter/material.dart';
import 'package:oapata_mart/src/PresentationLayer/config/routeGenerator.dart';

import 'src/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    App(
      routesGenerator: RoutesGenerator(),
    ),
  );
}
