import 'package:get/get.dart';

import '../../features/product_catalog/data/models/product_model.dart';
import '../../features/product_catalog/presentation/bindings/product_list_binding.dart';
import '../../features/product_catalog/presentation/controllers/product_detail_controller.dart';
import '../../features/product_catalog/presentation/pages/product_detail_page.dart';
import '../../features/product_catalog/presentation/pages/product_list_page.dart';
import '../../features/splash/presenter/bindings/splash_binding.dart';
import '../../features/splash/presenter/pages/splash_page.dart';
import '../widgets/app_widget.dart';

// All routes for app pages are defined here
class AppRoutes {
  static const String splashPage = '/splash_page';
  static const String noInternetPage = '/no_internet_page';
  static const String productsCatalogPage = '/product_catalog_page';
  static const String productsDetailPage = '/product_detail_page';

  static final List<GetPage> pages = [
    GetPage(
      name: splashPage,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: noInternetPage,
      page: () => const AppNoInternetView(),
    ),
    GetPage(
      name: productsCatalogPage,
      page: () => const ProductListPage(),
      binding: ProductListBinding(),
    ),
    GetPage(
      name: productsDetailPage,
      binding: BindingsBuilder(() {
        final product = Get.arguments as ProductModel;
        Get.lazyPut(() => ProductDetailController(product));
      }),
      page: () => const ProductDetailPage(),
    ),
  ];
}
