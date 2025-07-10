import 'package:flutter/material.dart';
import 'package:product_carousel/widgets/app_network_image.dart';

import 'models/product_carousel_model.dart';

/// A single product card used inside the [ProductCarousel].
///
/// Displays the product image with a title overlay, wrapped in a [Hero] widget
/// for smooth transition animations when navigating to a product detail screen.
class ProductCarouselItem extends StatelessWidget {
  /// The product data to render in the carousel card.
  final ProductCarouselModel product;

  /// Creates a visual representation of a product in the carousel.
  ///
  /// Requires a non-null [product].
  const ProductCarouselItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'carousel-${product.id}', // Unique tag for animation transitions
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              /// Lazy Loading product image from network with fallback and loader
              AppNetworkImage(
                product.imageUrl,
                fit: BoxFit.cover,
              ),

              /// Bottom overlay with product title
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(16),
                    ),
                  ),
                  child: Text(
                    product.title,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
