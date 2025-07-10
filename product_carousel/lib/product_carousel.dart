/// Product Carousel Widget Library
/// Author: Nikunj Dethariya
/// GitHub: https://github.com/dethariyanikunj
/// License: MIT

/// A library for rendering swipeable product carousels.
///
/// Exports the main [ProductCarousel] widget, item UI, and model classes.
library product_carousel;

import 'package:flutter/material.dart';
import 'package:product_carousel/product_carousel_item.dart';

import 'models/product_carousel_model.dart';

/// Exports for usage outside the package
export 'models/product_carousel_model.dart';
export 'product_carousel.dart';
export 'product_carousel_item.dart';

/// A horizontally scrollable carousel to showcase products with swipe gesture support.
///
/// Use this widget to display a list of [ProductCarouselModel] in a carousel format,
/// optionally responding to taps with [onItemTap].
///
/// ### Example:
/// ```dart
/// ProductCarousel(
///   products: products,
///   onItemTap: (product) => print(product.title),
/// )
/// ```
class ProductCarousel extends StatefulWidget {
  /// Creates a [ProductCarousel] widget.
  ///
  /// [products] must not be null.
  const ProductCarousel({
    super.key,
    required this.products,
    this.onItemTap,
    this.height,
  });

  /// The list of products to display in the carousel.
  final List<ProductCarouselModel> products;

  /// Optional callback when a product is tapped.
  final void Function(ProductCarouselModel)? onItemTap;

  /// Optional height of the carousel widget. Default is 250.
  final double? height;

  @override
  State<ProductCarousel> createState() => _ProductCarouselState();
}

class _ProductCarouselState extends State<ProductCarousel> {
  /// Controls the scroll behavior of the PageView.
  final PageController _pageController = PageController(
    viewportFraction: 0.8, // shows partial neighboring items for swipe hint
  );

  @override
  Widget build(BuildContext context) {
    // If there are no products, return an empty widget.
    if (widget.products.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: widget.height ?? 250,
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.products.length,
        itemBuilder: (_, index) {
          final product = widget.products[index];
          return GestureDetector(
            onTap: () => widget.onItemTap?.call(product),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ProductCarouselItem(product: product),
            ),
          );
        },
      ),
    );
  }
}
