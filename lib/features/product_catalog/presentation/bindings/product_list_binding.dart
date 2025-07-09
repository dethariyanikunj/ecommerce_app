import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductController(Get.find()));
  }
}
