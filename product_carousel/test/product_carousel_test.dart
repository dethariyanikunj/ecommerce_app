import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:product_carousel/product_carousel.dart';

void main() {
  group('ProductCarousel Widget Tests', () {
    // 🧪 Fake product data
    final testProducts = List.generate(
      3,
      (index) {
        return ProductCarouselModel()
          ..id = index
          ..title = 'Product $index'
          ..description = 'Desc $index'
          ..price = 100.0 + index
          ..imageUrl =
              'https://fastly.picsum.photos/id/1/200/300.jpg?hmac=jH5bDkLr6Tgy3oAg5khKCHeunZMHq0ehBZr6vGifPLY'
          ..rating = 4.0
          ..ratingCount = 50;
      },
    );

    Widget createTestWidget(Widget child) {
      return MaterialApp(
        home: Scaffold(body: child),
      );
    }

    testWidgets('renders all products passed to it', (tester) async {
      await tester.pumpWidget(createTestWidget(
        ProductCarousel(products: testProducts),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Product 0'), findsOneWidget);
      expect(find.text('Product 1'), findsOneWidget);
    });

    testWidgets('calls onItemTap when tapped', (tester) async {
      ProductCarouselModel? tapped;

      await tester.pumpWidget(createTestWidget(
        ProductCarousel(
          products: testProducts,
          onItemTap: (p) => tapped = p,
        ),
      ));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Product 0'));
      await tester.pump();

      expect(tapped, isNotNull);
      expect(tapped!.title, 'Product 0');
    });

    testWidgets('renders nothing if products list is empty', (tester) async {
      await tester.pumpWidget(createTestWidget(
        const ProductCarousel(products: []),
      ));
      await tester.pumpAndSettle();

      // Should return SizedBox.shrink()
      expect(find.byType(ProductCarousel), findsOneWidget);
      expect(find.byType(SizedBox), findsWidgets);
    });

    testWidgets('only renders visible items (viewport)', (tester) async {
      final limitedList = testProducts.take(2).toList();
      await tester.pumpWidget(createTestWidget(
        ProductCarousel(products: limitedList),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Product 0'), findsOneWidget);
      expect(find.text('Product 2'), findsNothing);
    });
  });
}
