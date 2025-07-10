import 'package:product_carousel/product_carousel.dart' as carousel;

import '../../data/models/product_model.dart';

extension ProductModelAdapter on ProductModel {
  carousel.ProductCarouselModel toCarouselModel() {
    return carousel.ProductCarouselModel()
      ..id = id
      ..title = title
      ..imageUrl = imageUrl
      ..price = price
      ..description = description
      ..rating = rating
      ..ratingCount = ratingCount;
  }
}

extension FromCarouselModel on carousel.ProductCarouselModel {
  ProductModel toIsarModel() {
    return ProductModel()
      ..id = id
      ..title = title
      ..description = description
      ..price = price
      ..imageUrl = imageUrl
      ..rating = rating
      ..ratingCount = ratingCount;
  }
}
