import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test/features/product_catalog/data/models/product_model.dart';

import '../../../../core/utils/app_utils.dart';
import '../../../../core/widgets/app_widget.dart';
import '../controllers/product_detail_controller.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final product = controller.product;

    return Scaffold(
      body: Column(
        children: [
          AppScreenTitleBar(
            title: product.title,
          ),
          _productInfoView(product)
        ],
      ),
    );
  }

  Widget _productInfoView(ProductModel product) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.dimensScreenHorizontalMargin.w,
          vertical: AppDimens.dimens20.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _productIconView(product),
            SizedBox(
              height: AppDimens.dimens16.h,
            ),
            Text(
              product.title,
              style: AppTextStyle.textSize22Bold,
            ),
            SizedBox(
              height: AppDimens.dimens8.h,
            ),
            _productRatingView(product),
            SizedBox(
              height: AppDimens.dimens12.h,
            ),
            Text(
              '₹${product.price.toStringAsFixed(2)}',
              style: AppTextStyle.textSize22Bold,
            ),
            SizedBox(
              height: AppDimens.dimens16.h,
            ),
            Text(
              'Description:',
              style: AppTextStyle.textSize16Regular,
            ),
            SizedBox(
              height: AppDimens.dimens8.h,
            ),
            Text(
              product.description,
              style: AppTextStyle.textSize16Regular,
            ),
          ],
        ),
      ),
    );
  }

  Widget _productIconView(ProductModel product) {
    return Hero(
      tag: product.heroTag,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: AppImageView(
          imagePath: product.imageUrl,
          height: AppDimens.dimens200.h,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _productRatingView(ProductModel product) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.orange,
          size: AppDimens.dimens22.w,
        ),
        SizedBox(
          width: AppDimens.dimens5.w,
        ),
        Text(
          '${product.rating} (${product.ratingCount})',
          style: AppTextStyle.textSize14SemiBold,
        ),
      ],
    );
  }
}
