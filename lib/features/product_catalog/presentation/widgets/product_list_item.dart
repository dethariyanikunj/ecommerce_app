import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/app_utils.dart';
import '../../../../core/widgets/app_widget.dart';
import '../../data/models/product_model.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({
    super.key,
    required this.productInfo,
    required this.index,
    required this.onProductTap,
    required this.isSkeletonView,
  });

  final ProductModel productInfo;
  final int index;
  final VoidCallback onProductTap;
  final bool isSkeletonView;

  @override
  Widget build(BuildContext context) {
    return Skeleton.leaf(
      child: AnimationConfiguration.staggeredList(
        position: index,
        duration: const Duration(milliseconds: 400),
        child: SlideAnimation(
          verticalOffset: 100,
          child: FadeInAnimation(
            child: GestureDetector(
              onTap: onProductTap,
              child: Card(
                margin: EdgeInsets.symmetric(
                  horizontal: AppDimens.dimensScreenHorizontalMargin.w,
                  vertical: AppDimens.dimens6.h,
                ),
                child: ListTile(
                  leading: Hero(
                    tag: productInfo.heroTag,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: AppImageView(
                        imagePath: productInfo.imageUrl,
                        width: AppDimens.dimens50.w,
                        height: AppDimens.dimens50.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(
                    productInfo.title,
                    style: AppTextStyle.textSize16Bold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: AppDimens.dimens5.h,
                      ),
                      Text(
                        productInfo.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.textSize14Regular,
                      ),
                      SizedBox(
                        height: AppDimens.dimens5.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: AppDimens.dimens20.w,
                            color: Colors.orange,
                          ),
                          Text(
                            ' ${productInfo.rating} (${productInfo.ratingCount})',
                            style: AppTextStyle.textSize14Regular,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: Text(
                    '₹${productInfo.price.toStringAsFixed(2)}',
                    style: AppTextStyle.textSize14SemiBold,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
