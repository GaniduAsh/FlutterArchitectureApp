import 'package:flutter_beta_app/features/beer_list/data/beer.dart';
import 'package:flutter_beta_app/features/beer_list/service/beer_list_service.dart';
import 'package:flutter_beta_app/network/api/api_response_list.dart';
import 'package:flutter_beta_app/network/api/base_api.dart';

abstract class BeerListRepository {
  Future<ApiResponseList<Beer>> getBeerList();
}

class BeerListRepositoryImpl extends BeerListRepository {
  BeerListService beerListService;

  BeerListRepositoryImpl({required this.beerListService});

  @override
  Future<ApiResponseList<Beer>> getBeerList() async {
    return beerListService.getBeerList();
  }
}
