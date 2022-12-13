import 'package:flutter_beta_app/features/beer_list/domain/usecase/beer_list_use_case.dart';
import 'package:flutter_beta_app/features/beer_list/presentation/notifier/beer_state_notifier.dart';
import 'package:flutter_beta_app/features/beer_list/repository/beer_list_repository.dart';
import 'package:flutter_beta_app/features/beer_list/service/beer_list_service.dart';
import 'package:get_it/get_it.dart';

import '../navigation/navigation_service.dart';

GetIt serviceLocator = GetIt.instance;

void setupLocator() {
  /// init NavigationService
  serviceLocator
      .registerLazySingleton<NavigationService>(() => NavigationService());

  /// init BeerListServiceImpl
  serviceLocator
      .registerLazySingleton<BeerListService>(() => BeerListServiceImpl());

  /// init BeerListRepository
  serviceLocator.registerLazySingleton<BeerListRepository>(() =>
      BeerListRepositoryImpl(
          beerListService: serviceLocator.get<BeerListService>()));

  /// init BeerUseCase
  serviceLocator.registerLazySingleton<BeerUseCase>(() => BeerUseCaseImpl(
      beerListRepository: serviceLocator.get<BeerListRepository>()));

  /// init BeerStateNotifier
  serviceLocator.registerLazySingleton<BeerStateNotifier>(() =>
      BeerStateNotifier(
          beerUseCase: serviceLocator.get<BeerUseCase>(),
          navigationService: serviceLocator.get<NavigationService>()));
}
