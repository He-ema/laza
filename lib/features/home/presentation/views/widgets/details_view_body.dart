import 'package:flutter/material.dart';
import 'package:laza/constants.dart';
import 'package:laza/core/utils/styles.dart';
import 'package:laza/core/shared_models/product_model/product_model.dart';
import 'package:laza/features/home/presentation/views/widgets/size_item.dart';

import 'details_button.dart';
import 'details_image_section.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody(
      {super.key,
      required this.product,
      required this.email,
      required this.changeColor});
  final ProductModel product;
  final String email;
  final VoidCallback changeColor;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        ImageSection(product: product, changeColor: changeColor),
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
              MyButtonDetails(
                product: product,
                email: email,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
