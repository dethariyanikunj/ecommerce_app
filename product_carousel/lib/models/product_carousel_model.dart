/// A lightweight model class to represent product information
/// for display inside the product carousel widget.
///
/// This model is intentionally kept free from persistence or
/// business logic dependencies (like Isar, Hive, etc.), and is
/// used purely for UI display purposes.
class ProductCarouselModel {
  /// The unique identifier for the product.
  late int id;

  /// The title or name of the product.
  late String title;

  /// A short description of the product.
  late String description;

  /// The price of the product.
  late double price;

  /// The full image URL to load the product image.
  late String imageUrl;

  /// Average rating for the product (e.g., 4.5).
  late double rating;

  /// Number of users who rated the product.
  late int ratingCount;
}
