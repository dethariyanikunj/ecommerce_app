import 'dart:math';

import 'package:isar/isar.dart';

part 'product_model.g.dart';

@collection
class ProductModel {
  Id id = Isar.autoIncrement;
  late String title;
  late String description;
  late double price;
  late String imageUrl;
  late double rating;
  late int ratingCount;

  @ignore
  final int _randomId = Random().nextInt(99999);

  @ignore
  String get heroTag => 'product-image-$id-$_randomId';
}
