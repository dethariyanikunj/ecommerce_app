import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test/core/widgets/app_outlined_button.dart';
import 'package:test/core/widgets/app_outlined_input_field.dart';
import 'package:test/features/product_catalog/presentation/widgets/search_filter_view.dart';

import '../../../../helpers/test_helpers.dart';
import '../../../../helpers/test_wrapper.dart';

void main() {
  late FakeProductController controller;

  setUp(() {
    controller = FakeProductController();
  });

  testWidgets('renders search input and filter icon',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithTestApp(SearchFilterView(controller: controller)),
    );

    // Check your custom input field
    expect(find.byType(AppOutlinedInputField), findsOneWidget);

    // Check if the TextField is inside it
    expect(
      find.descendant(
        of: find.byType(AppOutlinedInputField),
        matching: find.byType(TextField),
      ),
      findsOneWidget,
    );

    // Check filter icon
    expect(find.byIcon(Icons.filter_list), findsOneWidget);
  });

  testWidgets('opens bottom sheet with sliders and buttons',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithTestApp(SearchFilterView(controller: controller)),
    );

    await tester.tap(find.byIcon(Icons.filter_list));
    await tester.pumpAndSettle();

    // 2 sliders: price and rating
    expect(find.byType(RangeSlider), findsNWidgets(2));

    // Buttons should use AppOutlinedButton
    expect(find.byType(AppOutlinedButton), findsNWidgets(2));

    // Button texts
    expect(find.text('Apply'), findsOneWidget);
    expect(find.text('Reset'), findsOneWidget);
  });

  testWidgets('calls applyTempFilters when Apply is tapped',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithTestApp(SearchFilterView(controller: controller)),
    );

    await tester.tap(find.byIcon(Icons.filter_list));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Apply'));
    await tester.pumpAndSettle();

    expect(controller.applyCalled, isTrue);
  });

  testWidgets('calls resetFilters when Reset is tapped',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithTestApp(SearchFilterView(controller: controller)),
    );

    await tester.tap(find.byIcon(Icons.filter_list));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Reset'));
    await tester.pumpAndSettle();

    expect(controller.resetCalled, isTrue);
  });
}
