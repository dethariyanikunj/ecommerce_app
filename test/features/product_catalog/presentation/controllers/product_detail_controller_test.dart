import 'package:flutter_test/flutter_test.dart';
import 'package:test/features/product_catalog/data/models/product_model.dart';
import 'package:test/features/product_catalog/presentation/controllers/product_detail_controller.dart';

void main() {
  test('ProductDetailController holds correct product', () {
    final product = ProductModel()
      ..id = 1
      ..title = 'Test'
      ..description = 'Test Desc'
      ..price = 10.0
      ..rating = 4.2
      ..ratingCount = 55
      ..imageUrl = 'https://example.com/img';

    final controller = ProductDetailController(product);

    expect(controller.product.id, 1);
    expect(controller.product.title, 'Test');
  });
}
