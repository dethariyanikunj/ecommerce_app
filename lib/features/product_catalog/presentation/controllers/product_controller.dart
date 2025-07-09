import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_utils.dart';
import '../../data/models/product_model.dart';
import '../../domain/usecases/get_products.dart';

class ProductController extends GetxController {
  final GetProducts getProducts;
  ProductController(this.getProducts);

  final products = <ProductModel>[].obs;
  final allProducts = <ProductModel>[];
  List<ProductModel> filteredProducts = [];

  final initialLoading = false.obs;
  final isLoading = false.obs;
  final hasMore = true.obs;
  final searchText = ''.obs;
  final isFilterApplied = false.obs;

  final scrollController = ScrollController();
  final searchController = TextEditingController();

  int page = 1;
  final int limit = 20;

  RxDouble minPrice = 0.0.obs;
  RxDouble maxPrice = 1000.0.obs;
  RxDouble minRating = 0.0.obs;
  RxDouble maxRating = 5.0.obs;

  double globalMinPrice = 0.0;
  double globalMaxPrice = 1000.0;
  double globalMinRating = 0.0;
  double globalMaxRating = 5.0;

  RxDouble tempMinPrice = 0.0.obs;
  RxDouble tempMaxPrice = 1000.0.obs;
  RxDouble tempMinRating = 0.0.obs;
  RxDouble tempMaxRating = 5.0.obs;

  Timer? _debounce;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_onScroll);
    loadProducts();
  }

  void _onScroll() {
    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200 &&
        hasMore.value &&
        !isLoading.value) {
      page++;
      _paginate();
    }
  }

  Future<void> loadProducts() async {
    isLoading.value = true;
    initialLoading.value = true;
    try {
      final result = await getProducts();
      allProducts.assignAll(result);

      globalMinPrice =
          allProducts.map((e) => e.price).reduce((a, b) => a < b ? a : b);
      globalMaxPrice =
          allProducts.map((e) => e.price).reduce((a, b) => a > b ? a : b);

      minPrice.value = globalMinPrice;
      maxPrice.value = globalMaxPrice;
      minRating.value = globalMinRating;
      maxRating.value = globalMaxRating;

      tempMinPrice.value = globalMinPrice;
      tempMaxPrice.value = globalMaxPrice;
      tempMinRating.value = globalMinRating;
      tempMaxRating.value = globalMaxRating;

      _filter();
    } finally {
      isLoading.value = false;
      initialLoading.value = false;
    }
  }

  void onSearchChanged(String value) {
    searchText.value = value;
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      _filter();
      _hasMoreData();
    });
  }

  void openFilterSheetDefaults() {
    tempMinPrice.value = minPrice.value;
    tempMaxPrice.value = maxPrice.value;
    tempMinRating.value = minRating.value;
    tempMaxRating.value = maxRating.value;
  }

  void applyTempFilters() {
    minPrice.value = tempMinPrice.value;
    maxPrice.value = tempMaxPrice.value;
    minRating.value = tempMinRating.value;
    maxRating.value = tempMaxRating.value;
    isFilterApplied.value = true;
    _filter();
    _hasMoreData();
  }

  void resetFilters() {
    minPrice.value = globalMinPrice;
    maxPrice.value = globalMaxPrice;
    minRating.value = globalMinRating;
    maxRating.value = globalMaxRating;
    isFilterApplied.value = false;
    _filter();
    _hasMoreData();
  }

  void _hasMoreData() {
    if (searchText.value.trim().isEmpty && isFilterApplied.isFalse) {
      hasMore.value = true;
    } else {
      hasMore.value = false;
    }
  }

  void _filter() {
    products.clear();
    final query = searchText.value.toLowerCase();
    filteredProducts = allProducts
        .where(
          (p) =>
              p.title.toLowerCase().contains(query) &&
              p.price >= minPrice.value &&
              p.price <= maxPrice.value &&
              p.rating >= minRating.value &&
              p.rating <= maxRating.value,
        )
        .toList();

    products.addAll(filteredProducts);
  }

  void _paginate() async {
    isLoading.value = true;
    try {
      final result = await getProducts();

      final query = searchText.value.toLowerCase();
      final filtered = result
          .where(
            (p) =>
                p.title.toLowerCase().contains(query) &&
                p.price >= minPrice.value &&
                p.price <= maxPrice.value &&
                p.rating >= minRating.value &&
                p.rating <= maxRating.value,
          )
          .toList();

      // Simulate infinite appending
      final start = ((page - 1) * limit) % filtered.length;
      final end = (start + limit).clamp(0, filtered.length);

      final chunk = filtered.sublist(start, end);
      products.addAll(chunk);

      page++; // increment page always
    } finally {
      isLoading.value = false;
    }
  }

  ProductModel dummyDataForSkeleton() {
    return ProductModel()
      ..id = 1
      ..imageUrl = AppAssets.icPlaceholder
      ..title = 'Rain Jacket Women Wind'
      ..description = '100% Polyester - Jacket is US Standard Size'
      ..price = 340.57
      ..rating = 3.8
      ..ratingCount = 300;
  }
}
