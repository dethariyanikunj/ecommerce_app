library product_carousel;

import 'package:flutter/material.dart';
import 'package:product_carousel/product_carousel_item.dart';

import 'models/product_carousel_model.dart';

export 'models/product_carousel_model.dart';
export 'product_carousel.dart';
export 'product_carousel_item.dart';

/// A horizontally scrollable carousel to showcase products with swipe gesture support.
///
/// Use this widget to display a list of [ProductCarouselModel] in a carousel format.
///
/// Example:
/// ```dart
/// ProductCarousel(
///   products: products,
///   onItemTap: (product) => print(product.title),
/// )
/// ```
class ProductCarousel extends StatefulWidget {
  const ProductCarousel({
    super.key,
    required this.products,
    this.onItemTap,
    this.height,
  });

  final List<ProductCarouselModel> products;
  final void Function(ProductCarouselModel)? onItemTap;
  final double? height;

  @override
  State<ProductCarousel> createState() => _ProductCarouselState();
}

class _ProductCarouselState extends State<ProductCarousel> {
  final PageController _pageController = PageController(
    viewportFraction: 0.8,
  );

  @override
  Widget build(BuildContext context) {
    if (widget.products.isEmpty) {
      return const SizedBox.shrink();
    }
    return SizedBox(
      height: widget.height ?? 250,
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.products.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () => widget.onItemTap?.call(widget.products[index]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ProductCarouselItem(product: widget.products[index]),
            ),
          );
        },
      ),
    );
  }
}
