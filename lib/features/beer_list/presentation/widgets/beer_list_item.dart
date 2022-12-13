import 'package:flutter/material.dart';
import 'package:flutter_beta_app/features/beer_list/data/beer.dart';

import '../notifier/beer_state_notifier.dart';

class BeerListItem extends StatelessWidget {
  final Beer beer;
  final OnTapListener listener;

  const BeerListItem({Key? key, required this.beer, required this.listener})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Card(
            child: Row(
          children: [
            Container(
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                child: Image.network(
                  beer.imageUrl,
                  width: 100,
                  height: 100,
                )),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(
                    beer.tagline,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5.0),
                  Text(beer.name,
                      style: const TextStyle(fontStyle: FontStyle.italic)),
                  const SizedBox(height: 5.0),
                  Text('IBU - ' + beer.ibu.toString()),
                  Text('VOL - ' + beer.abv.toString())
                ]))
          ],
        )),
        onTap: () {
          listener.onTapBeer(beer);
        });
  }
}
