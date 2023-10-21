import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:laza/features/home/data/product_model/product_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../../core/utils/styles.dart';

class GridItem extends StatelessWidget {
  const GridItem({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: CachedNetworkImage(
              imageUrl: product.image,
              fit: BoxFit.fill,
              placeholder: (context, url) => SpinKitSpinningLines(
                  color: Theme.of(context).colorScheme.tertiary),
            ),
          ),
        ),
        Container(
          width: 150,
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            product.name,
            style: Styles.textstyle11,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          width: 150,
          child: Text(
            '\$${product.price}',
            style: Styles.textstyle13.copyWith(fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
