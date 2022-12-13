import 'package:flutter_beta_app/features/beer_list/data/beer.dart';
import 'package:flutter_beta_app/network/api/api_enum.dart';
import 'package:flutter_beta_app/network/api/api_response_list.dart';
import 'package:flutter_beta_app/network/api/base_api.dart';

abstract class BeerListService {
  Future<ApiResponseList<Beer>> getBeerList();
}

class BeerListServiceImpl extends BeerListService {
  @override
  Future<ApiResponseList<Beer>> getBeerList() async {
    var response = await BaseApi.execute(
        'https://api.punkapi.com/v2/beers', MethodType.get);

    return ApiResponseList<Beer>(response, Beer.fromJson);
  }
}
