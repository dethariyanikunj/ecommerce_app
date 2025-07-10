import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/localizations/language_keys.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_dimens.dart';
import '../../../../core/widgets/app_widget.dart';
import '../controllers/product_controller.dart';

class SearchFilterView extends StatelessWidget {
  const SearchFilterView({
    super.key,
    required this.controller,
  });

  final ProductController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.dimensScreenHorizontalMargin.w,
        vertical: AppDimens.dimens15.h,
      ),
      child: Row(
        children: [
          Expanded(
            child: AppOutlinedInputField(
              controller: controller.searchController,
              onTextChanged: controller.onSearchChanged,
              hintText: LanguageKey.searchHint.tr,
            ),
          ),
          SizedBox(
            width: AppDimens.dimens10.w,
          ),
          Obx(
            () => IconButton(
              icon: Icon(
                Icons.filter_list,
                color: controller.isFilterApplied.value
                    ? AppColors.primary
                    : AppColors.color6C6C6C,
              ),
              onPressed: () => _openFilterSheet(context, controller),
            ),
          ),
        ],
      ),
    );
  }

  void _openFilterSheet(BuildContext context, ProductController controller) {
    FocusManager.instance.primaryFocus?.unfocus();
    controller.openFilterSheetDefaults();
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            AppDimens.dimens16.r,
          ),
        ),
      ),
      builder: (_) => SafeArea(
        child: Padding(
          padding: EdgeInsets.all(
            AppDimens.dimens16.w,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                LanguageKey.priceRange.tr,
              ),
              Obx(
                () => RangeSlider(
                  activeColor: AppColors.primary,
                  values: RangeValues(
                    controller.tempMinPrice.value,
                    controller.tempMaxPrice.value,
                  ),
                  min: controller.globalMinPrice,
                  max: controller.globalMaxPrice,
                  divisions: 20,
                  labels: RangeLabels(
                    controller.tempMinPrice.value.toStringAsFixed(0),
                    controller.tempMaxPrice.value.toStringAsFixed(0),
                  ),
                  onChanged: (v) {
                    controller.tempMinPrice.value = v.start;
                    controller.tempMaxPrice.value = v.end;
                  },
                ),
              ),
              Text(
                LanguageKey.ratingRange.tr,
              ),
              Obx(
                () => RangeSlider(
                  activeColor: AppColors.primary,
                  values: RangeValues(
                    controller.tempMinRating.value,
                    controller.tempMaxRating.value,
                  ),
                  min: controller.globalMinRating,
                  max: controller.globalMaxRating,
                  divisions: 10,
                  labels: RangeLabels(
                    controller.tempMinRating.value.toStringAsFixed(1),
                    controller.tempMaxRating.value.toStringAsFixed(1),
                  ),
                  onChanged: (v) {
                    controller.tempMinRating.value = v.start;
                    controller.tempMaxRating.value = v.end;
                  },
                ),
              ),
              SizedBox(
                height: AppDimens.dimens8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppOutlinedButton(
                      onPressed: () {
                        controller.resetFilters();
                        Get.back();
                      },
                      text: LanguageKey.reset.tr,
                    ),
                  ),
                  SizedBox(
                    width: AppDimens.dimensScreenHorizontalMargin.w,
                  ),
                  Expanded(
                    child: AppOutlinedButton(
                      onPressed: () {
                        controller.applyTempFilters();
                        Get.back();
                      },
                      text: LanguageKey.apply.tr,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
