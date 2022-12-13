import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../beer_list/data/beer.dart';

class BeerDetailsScreen extends StatelessWidget {
  final Beer beer;

  const BeerDetailsScreen({Key? key, required this.beer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(beer.name)),
      body: Column(children: [
        Container(
            alignment: Alignment.center,
            child: Image.network(
              beer.imageUrl,
              width: 300,
              height: 200,
            )),
        Flexible(
            flex: 1,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('IBU -' + beer.ibu.toString()),
                  Text('VOL -' + beer.abv.toString())
                ])),
        Text(beer.name),
        Expanded(child: Text(beer.description))
      ]),
    );
  }
}
