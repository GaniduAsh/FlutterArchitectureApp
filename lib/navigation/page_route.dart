import 'package:flutter/material.dart';
import 'package:flutter_beta_app/features/beer_details/presentation/widgets/beer_details_screen.dart';
import 'package:flutter_beta_app/features/beer_list/data/beer.dart';

import '../features/beer_list/presentation/widgets/beer_list_screen.dart';

const String beerList = 'beer-list';
const String beerDetails = 'beer-details';

Route<dynamic> generatePageRoute(RouteSettings settings) {
  switch (settings.name) {
    case beerList:
      return MaterialPageRoute(builder: (context) => const BeerListScreen());
    case beerDetails:
      var instance = settings.arguments as Beer;
      return MaterialPageRoute(
          builder: (context) => BeerDetailsScreen(beer: instance));
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      );
  }
}
