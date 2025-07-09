import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:test/features/product_catalog/data/models/product_model.dart';
import 'package:test/features/product_catalog/presentation/controllers/product_controller.dart';

import '../../../../mocks.mocks.dart';

void main() {
  late ProductController controller;
  late MockGetProducts mockGetProducts;

  final mockData = List.generate(
    20,
    (i) => ProductModel()
      ..id = i
      ..title = 'Item $i'
      ..description = 'Desc $i'
      ..price = i.toDouble()
      ..rating = 4.0
      ..ratingCount = 100
      ..imageUrl = 'http://image.com/$i',
  );

  setUp(() {
    Get.reset(); // clean GetX instance
    mockGetProducts = MockGetProducts();
    when(mockGetProducts()).thenAnswer((_) async => mockData);

    controller = ProductController(mockGetProducts);
  });

  test('loadProducts loads initial list', () async {
    await controller.loadProducts();

    expect(controller.products.length, 20);
    expect(controller.isLoading.value, false);
    expect(controller.minPrice.value, 0.0);
    expect(controller.maxPrice.value, 19.0);
  });

  test('onSearchChanged filters products by title', () async {
    await controller.loadProducts();

    controller.onSearchChanged('Item 1');
    await Future.delayed(
        const Duration(milliseconds: 500)); // wait for debounce

    expect(
        controller.products
            .any((p) => p.title.toLowerCase().contains('item 1')),
        true);
    expect(controller.products.length, greaterThan(0));
  });

  test('applyTempFilters filters by price and rating range', () async {
    await controller.loadProducts();

    controller.tempMinPrice.value = 5.0;
    controller.tempMaxPrice.value = 10.0;
    controller.tempMinRating.value = 4.0;
    controller.tempMaxRating.value = 4.0;

    controller.applyTempFilters();

    final results = controller.products;
    expect(
        results
            .every((p) => p.price >= 5.0 && p.price <= 10.0 && p.rating == 4.0),
        true);
  });

  test('resetFilters restores full product list', () async {
    await controller.loadProducts();

    // apply filter
    controller.tempMinPrice.value = 10.0;
    controller.tempMaxPrice.value = 15.0;
    controller.applyTempFilters();
    final filteredCount = controller.products.length;

    controller.resetFilters();
    final restoredCount = controller.products.length;

    expect(restoredCount > filteredCount, true);
    expect(controller.searchText.value, '');
    expect(controller.isFilterApplied.value, false);
  });
}
