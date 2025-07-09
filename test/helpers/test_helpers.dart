import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/features/product_catalog/presentation/controllers/product_controller.dart';

import 'test_get_products.dart';

class FakeProductController extends ProductController {
  FakeProductController() : super(FakeGetProducts());

  // Override only what’s needed for this widget
  @override
  final TextEditingController searchController = TextEditingController();

  @override
  final RxBool isFilterApplied = false.obs;

  @override
  final RxDouble tempMinPrice = 0.0.obs;
  @override
  final RxDouble tempMaxPrice = 1000.0.obs;
  @override
  final RxDouble tempMinRating = 0.0.obs;
  @override
  final RxDouble tempMaxRating = 5.0.obs;

  @override
  double get globalMinPrice => 0.0;
  @override
  double get globalMaxPrice => 1000.0;
  @override
  double get globalMinRating => 0.0;
  @override
  double get globalMaxRating => 5.0;

  bool resetCalled = false;
  bool applyCalled = false;

  @override
  void resetFilters() {
    resetCalled = true;
  }

  @override
  void applyTempFilters() {
    applyCalled = true;
  }

  @override
  void onSearchChanged(String value) {}

  @override
  void openFilterSheetDefaults() {}
}
