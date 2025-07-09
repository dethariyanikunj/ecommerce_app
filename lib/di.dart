import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/product_catalog/data/datasources/product_local_data_source.dart';
import '../../features/product_catalog/data/datasources/product_remote_data_source.dart';
import '../../features/product_catalog/data/models/product_model.dart';
import '../../features/product_catalog/data/repositories/product_repository_impl.dart';
import '../../features/product_catalog/domain/repositories/product_repository.dart';
import '../../features/product_catalog/domain/usecases/get_products.dart';

Future<void> initDependencies() async {
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([ProductModelSchema], directory: dir.path);

  Get.put<Isar>(isar);
  Get.put<Dio>(Dio());

  // Data Sources
  Get.put(ProductRemoteDataSource(Get.find<Dio>()));
  Get.put(ProductLocalDataSource(Get.find<Isar>()));

  // Repository
  Get.put<ProductRepository>(
    ProductRepositoryImpl(
      remote: Get.find(),
      local: Get.find(),
    ),
  );

  Get.put(GetProducts(Get.find()));
}
