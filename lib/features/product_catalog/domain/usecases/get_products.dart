import '../../data/models/product_model.dart';
import '../repositories/product_repository.dart';

class GetProducts {
  final ProductRepository repository;
  GetProducts(this.repository);

  Future<List<ProductModel>> call({
    bool fromCache = false,
  }) {
    return repository.getProducts(fromCache: fromCache);
  }
}
