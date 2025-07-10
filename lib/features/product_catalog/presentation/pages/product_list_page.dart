import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:product_carousel/product_carousel.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:test/features/product_catalog/presentation/adapters/product_carousel_adapter.dart';

import '../../../../core/const/app_const.dart';
import '../../../../core/localizations/language_keys.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../../core/widgets/app_screen_title_bar.dart';
import '../controllers/product_controller.dart';
import '../widgets/product_list_item.dart';
import '../widgets/search_filter_view.dart';

class ProductListPage extends GetView<ProductController> {
  const ProductListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              AppScreenTitleBar(
                title: LanguageKey.products.tr,
                isBackButtonVisible: false,
              ),
              Obx(
                () {
                  if (controller.isOnline.isTrue) {
                    return const SizedBox.shrink();
                  }
                  return Positioned(
                    right: AppDimens.dimensScreenHorizontalMargin.w,
                    top: AppDimens.dimens15.h,
                    child: _offlineModeTag(),
                  );
                },
              ),
            ],
          ),
          SizedBox(
            height: AppDimens.dimens20.h,
          ),
          _carouselView(),
          SearchFilterView(
            controller: controller,
          ),
          Expanded(
            child: Obx(
              () {
                final isSkeletonNeedToShow = controller.initialLoading.isTrue;
                if (!isSkeletonNeedToShow && controller.products.isEmpty) {
                  return Padding(
                    padding: EdgeInsets.all(
                      AppDimens.dimens25.w,
                    ),
                    child: Text(
                      LanguageKey.noDataFound.tr,
                      style: AppTextStyle.textSize22Bold,
                    ),
                  );
                }
                return Skeletonizer(
                  enabled: isSkeletonNeedToShow,
                  child: AnimationLimiter(
                    child: ListView.builder(
                      padding: EdgeInsets.only(
                        bottom: AppDimens.dimens20.h,
                      ),
                      controller: controller.scrollController,
                      itemCount: isSkeletonNeedToShow
                          ? AppSkeletonConst.defaultVerticalItem
                          : controller.products.length +
                              (controller.hasMore.value ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (isSkeletonNeedToShow) {
                          final product = controller.dummyDataForSkeleton();
                          return ProductListItem(
                            productInfo: product,
                            index: index,
                            onProductTap: () {},
                            isSkeletonView: true,
                          );
                        }
                        if (index == controller.products.length) {
                          if (controller.isOnline.isTrue) {
                            return Padding(
                              padding: EdgeInsets.all(
                                AppDimens.dimens16.w,
                              ),
                              child: const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primary,
                                ),
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        }
                        final product = controller.products[index];
                        return ProductListItem(
                          productInfo: product,
                          index: index,
                          onProductTap: () => controller.navigateToDetailScreen(
                            product,
                          ),
                          isSkeletonView: false,
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _offlineModeTag() {
    return SafeArea(
      child: Text(
        '🔴 ${LanguageKey.offlineModeTag.tr}',
        textAlign: TextAlign.center,
        style: AppTextStyle.textSize16Bold.copyWith(
          color: AppColors.colorD32F2F,
        ),
      ),
    );
  }

  Widget _carouselView() {
    return Obx(
      () {
        final products = controller.carouselProducts.value;
        final carouselProducts =
            products.map((p) => p.toCarouselModel()).toList();

        return ProductCarousel(
          height: AppDimens.dimens200.h,
          products: carouselProducts,
          onItemTap: (carouselProduct) {
            controller.navigateToDetailScreen(
              carouselProduct.toIsarModel(),
            );
          },
        );
      },
    );
  }
}
