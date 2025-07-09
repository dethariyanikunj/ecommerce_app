import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../../../core/utils/app_env_info.dart';
import '../models/product_model.dart';

class ProductRemoteDataSource {
  final Dio dio;
  ProductRemoteDataSource(this.dio);

  Future<List<ProductModel>> fetchProducts() async {
    final response = await dio.get(
      '${AppEnvInfo.apiBaseUrl}${ApiEndpoints.products}',
    );
    return (response.data as List)
        .map((e) => ProductModel()
          ..title = e['title']
          ..description = e['description']
          ..price = double.tryParse(e['price'].toString()) ?? 0.0
          ..imageUrl = e['image'] ?? ''
          ..rating =
              double.tryParse(e['rating']?['rate']?.toString() ?? '') ?? 0.0
          ..ratingCount =
              int.tryParse(e['rating']?['count']?.toString() ?? '') ?? 0)
        .toList();
  }
}
