import 'package:flutter/material.dart';
import 'package:flutter_beta_app/navigation/navigation_service.dart';
import 'package:flutter_beta_app/navigation/page_route.dart' as page_route;

import 'locator/service_locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: serviceLocator<NavigationService>().navigatorKey,
        initialRoute: page_route.beerList,
        onGenerateRoute: page_route.generatePageRoute,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ));
  }
}
