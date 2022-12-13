import 'package:json_annotation/json_annotation.dart';

part 'beer.g.dart';

@JsonSerializable()
class Beer {
  final int id;
  final String name;
  final String tagline;
  final String description;
  final double? abv;
  final double? ibu;

  @JsonKey(name: 'first_brewed')
  final String firstBrewed;
  @JsonKey(name: 'image_url')
  final String imageUrl;

  Beer(
      {required this.id,
      required this.name,
      required this.tagline,
      required this.firstBrewed,
      required this.description,
      required this.imageUrl,
      required this.abv,
      required this.ibu});

  factory Beer.fromJson(Map<String, dynamic> json) => _$BeerFromJson(json);
  Map<String, dynamic> toJson() => _$BeerToJson(this);
}

/// DATA MOCK
///  {
///  "id":1,
/// "name":"Buzz",
/// "tagline":"A Real Bitter Experience.",
/// "first_brewed":"09/2007",
/// "description":"A light, crisp and bitter IPA brewed with English and American hops. A small batch brewed only once.",
/// "image_url":"https:///images.punkapi.com/v2/keg.png",
/// "abv":4.5,
/// "ibu":60,
/// "target_fg":1010,
/// "target_og":1044,
/// "ebc":20,
/// "srm":10,
/// "ph":4.4,
/// "attenuation_level":75,
/// "volume":{
/// "value":20,
/// "unit":"litres"
/// },
/// "boil_volume":{
/// "value":25,
/// "unit":"litres"
/// },
/// "method":{
/// "mash_temp":[
/// {
/// "temp":{
/// "value":64,
/// "unit":"celsius"
/// },
/// "duration":75
/// }
/// ],
/// "fermentation":{
/// "temp":{
/// "value":19,
/// "unit":"celsius"
/// }
/// },
/// "twist":null}
