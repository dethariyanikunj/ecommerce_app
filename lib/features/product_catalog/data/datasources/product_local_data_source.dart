import 'package:isar/isar.dart';

import '../models/product_model.dart';

class ProductLocalDataSource {
  final Isar isar;
  ProductLocalDataSource(this.isar);

  Future<void> cacheProducts(List<ProductModel> products) async {
    await isar.writeTxn(() async {
      await isar.productModels.clear();
      await isar.productModels.putAll(products);
    });
  }

  Future<List<ProductModel>> getCachedProducts() async {
    return await isar.productModels.where().findAll();
  }
}
