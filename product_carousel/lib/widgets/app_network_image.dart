// lib/core/widgets/app_network_image.dart
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppNetworkImage extends StatelessWidget {
  final String url;
  final BoxFit fit;

  const AppNetworkImage(
    this.url, {
    this.fit = BoxFit.cover,
    super.key,
  });

  bool get isRunningInTest => Platform.environment.containsKey('FLUTTER_TEST');

  @override
  Widget build(BuildContext context) {
    if (isRunningInTest) {
      // Use regular Image.network in test mode
      return Image.network(
        url,
        fit: BoxFit.cover,
        loadingBuilder: (_, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(child: CircularProgressIndicator());
        },
        errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
      );
    }

    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      placeholder: (_, __) => const Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (_, __, ___) => const Center(
        child: Icon(Icons.broken_image),
      ),
    );
  }
}
