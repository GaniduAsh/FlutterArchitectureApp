import 'package:flutter_beta_app/features/beer_list/data/beer.dart';
import 'package:flutter_beta_app/features/beer_list/repository/beer_list_repository.dart';
import 'package:flutter_beta_app/network/api/api_response_list.dart';
import 'package:flutter_beta_app/network/api/base_api.dart';

abstract class BeerUseCase {
  Future<ApiResponseList<Beer>> getBeerList();
}

class BeerUseCaseImpl implements BeerUseCase {
  BeerListRepository beerListRepository;

  BeerUseCaseImpl({required this.beerListRepository});

  @override
  Future<ApiResponseList<Beer>> getBeerList() {
    return beerListRepository.getBeerList();
  }
}
