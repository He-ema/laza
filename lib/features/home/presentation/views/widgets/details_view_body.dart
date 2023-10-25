import 'package:flutter/material.dart';
import 'package:laza/constants.dart';
import 'package:laza/core/utils/styles.dart';
import 'package:laza/core/utils/widgets/custom_button.dart';
import 'package:laza/features/home/data/product_model/product_model.dart';
import 'package:laza/features/home/presentation/views/widgets/size_item.dart';

import 'details_image_section.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        ImageSection(product: product),
        SliverFillRemaining(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  product.name,
                  style: Styles.textstyle22,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Spacer(),
                    Text(
                      '\$${product.price}',
                      style: Styles.textstyle22,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Sizes',
                  style: Styles.textstyle17.copyWith(color: kGreyText),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizeItem(text: 'S'),
                    SizeItem(text: 'M'),
                    SizeItem(text: 'L'),
                    SizeItem(text: 'XL'),
                    SizeItem(text: '2XL'),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Description',
                  style: Styles.textstyle17.copyWith(color: kGreyText),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  product.description,
                  style: Styles.textstyle15,
                ),
              ),
              const Spacer(),
              CustomButton(
                text: 'Add to Cart',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
