

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vikn_test/core/constants/colors.dart';

class ImageView extends StatelessWidget {
  final dynamic imageSource;
  final double imageHeight;
  final double imageWidth;

  final BoxFit fit;
  final Color? backgroundColor;

  const ImageView({
    super.key,
    required this.imageSource,
    this.imageHeight = 100,
    this.imageWidth = 100,
    this.fit = BoxFit.cover,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    if (imageSource.startsWith('http') || imageSource.startsWith('https')) {
     
      return CachedNetworkImage(
        imageUrl: imageSource as String,
        fit: fit,
        imageBuilder: (context, imageProvider) {
          return Container(
            height: imageHeight,
            width: imageWidth,
            decoration: BoxDecoration(
              color: backgroundColor,
              image: DecorationImage(
                fit: fit,
                image: imageProvider,
              ),
              shape: BoxShape.circle,
            ),
          );
        },
        placeholder: (context, url) => _buildPlaceholder(),
        errorWidget: (context, url, error) => _buildErrorIcon(),
      );
    } else {
      // Asset image
      return _buildImageContainer(
        Image.asset(
          imageSource as String,
          fit: fit,
          height: imageHeight,
          width: imageWidth,
        ),
      );
    }
  }

  Widget _buildImageContainer(Widget image) {
    return Container(
      height: imageHeight,
      width: imageWidth,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(imageWidth / 2),
        child: image,
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      height: imageHeight,
      width: imageWidth,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.profileRidesColor,
        shape: BoxShape.circle,
      ),
      child: const Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }

  Widget _buildErrorIcon() {
    return Container(
      height: imageHeight,
      width: imageWidth,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.profileRidesColor,
        shape: BoxShape.circle,
      ),
      child: const Center(
        child: Icon(Icons.error),
      ),
    );
  }
}
