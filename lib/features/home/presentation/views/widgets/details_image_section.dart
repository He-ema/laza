import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/widgets/custom_icon.dart';
import '../../../../../core/shared_models/product_model/product_model.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
    required this.product,
    required this.changeColor,
  });

  final ProductModel product;
  final VoidCallback changeColor;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Hero(
        tag: product.name,
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Container(
              color: const Color(0xfff3f3f3),
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: CachedNetworkImage(
                  imageUrl: product.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: kTopSpace,
              left: 20,
              child: CustomIcon(
                color: Colors.white,
                contetnt: const Icon(Icons.arrow_back, color: Colors.black),
                onTap: () {
                  GoRouter.of(context).pop();
                  changeColor();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
