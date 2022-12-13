import 'package:flutter/material.dart';
import 'package:flutter_beta_app/features/beer_list/presentation/notifier/beer_state_notifier.dart';
import 'package:flutter_beta_app/features/beer_list/presentation/widgets/beer_list_item.dart';
import 'package:provider/provider.dart';

import '../../../../locator/service_locator.dart';

class BeerListScreen extends StatefulWidget {
  const BeerListScreen({Key? key}) : super(key: key);

  @override
  State<BeerListScreen> createState() => _BeerListScreenState();
}

class _BeerListScreenState extends State<BeerListScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BeerStateNotifier>(
        create: (context) => serviceLocator<BeerStateNotifier>(),
        builder: (context, child) {
          return Consumer<BeerStateNotifier>(
              builder: (context, notifier, child) => Scaffold(
                    appBar: AppBar(title: const Text('Beer List Screen')),
                    body: ListView.builder(
                      itemBuilder: ((context, index) {
                        return BeerListItem(
                          beer: notifier.beers[index],
                          listener: notifier,
                        );
                      }),
                      itemCount: notifier.beers.length,
                    ),
                  ));
        });
  }
}
