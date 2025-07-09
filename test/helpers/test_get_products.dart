import 'package:test/features/product_catalog/data/models/product_model.dart';
import 'package:test/features/product_catalog/domain/repositories/product_repository.dart';
import 'package:test/features/product_catalog/domain/usecases/get_products.dart';

class FakeGetProducts extends GetProducts {
  FakeGetProducts() : super(FakeProductRepository());
}

class FakeProductRepository implements ProductRepository {
  @override
  Future<List<ProductModel>> getProducts({bool fromCache = false}) async {
    return []; // you can mock sample products here if needed
  }
}
