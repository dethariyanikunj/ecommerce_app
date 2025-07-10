# 🛍️ Product Carousel Flutter Widget

A clean, reusable, customizable product carousel widget for Flutter with gesture support and Hero animations.

## Features

✅ Swipeable PageView  
✅ Hero animation  
✅ Tappable products  
✅ Optional height  
✅ Easily pluggable into any project

## Usage

```dart
import 'package:product_carousel/product_carousel.dart';

ProductCarousel(
  products: myProductList,
  onItemTap: (product) {
    // Navigate to detail page
  },
)