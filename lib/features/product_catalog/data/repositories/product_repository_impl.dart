import '../../domain/repositories/product_repository.dart';
import '../datasources/product_local_data_source.dart';
import '../datasources/product_remote_data_source.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remote;
  final ProductLocalDataSource local;

  ProductRepositoryImpl({
    required this.remote,
    required this.local,
  });

  @override
  Future<List<ProductModel>> getProducts({
    bool fromCache = false,
  }) async {
    if (fromCache) {
      return await local.getCachedProducts();
    }
    final products = await remote.fetchProducts();
    await local.cacheProducts(products);
    return products;
  }
}
