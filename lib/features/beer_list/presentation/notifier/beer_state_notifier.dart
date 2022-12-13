import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';
import 'package:flutter_beta_app/features/beer_list/data/beer.dart';
import 'package:flutter_beta_app/navigation/navigation_service.dart';
import 'package:flutter_beta_app/navigation/page_route.dart';

import '../../domain/usecase/beer_list_use_case.dart';

class BeerStateNotifier extends ChangeNotifier implements OnTapListener {
  final BeerUseCase beerUseCase;
  final NavigationService navigationService;
  List<Beer> beers = [];

  BeerStateNotifier(
      {required this.beerUseCase, required this.navigationService}) {
    getBeerList();
  }

  Future<void> getBeerList() async {
    var response = await beerUseCase.getBeerList();
    if (response.data != null) {
      beers = response.data!;
    }
    notifyListeners();
  }

  @override
  void onTapBeer(Beer beer) {
    dev.log('beer name -:' + beer.name);
    navigationService.navigateTo(beerDetails, arguments: beer);
  }
}

abstract class OnTapListener {
  void onTapBeer(Beer beer);
}
