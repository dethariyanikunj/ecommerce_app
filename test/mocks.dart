import 'package:mockito/annotations.dart';
import 'package:test/features/product_catalog/domain/usecases/get_products.dart';
import 'package:test/features/product_catalog/presentation/controllers/product_controller.dart';

@GenerateMocks([
  GetProducts,
  ProductController,
])
void main() {}
