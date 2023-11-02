import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../shared_models/product_model/product_model.dart';
import '../styles.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
    required this.product,
    required this.email,
    required this.index,
    required this.startAnimation,
  });
  final String email;
  final ProductModel product;
  final int index;
  final bool startAnimation;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(
          startAnimation ? 0 : MediaQuery.of(context).size.width, 0, 0),
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300 + (index * 100)),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? Theme.of(context).colorScheme.secondary.withOpacity(0.7)
            : Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      height: 150,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: product.image,
              placeholder: (context, url) => SizedBox(
                child: SpinKitSpinningLines(
                    color: Theme.of(context).colorScheme.tertiary),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
              Text(
                '\$${product.price}',
                style: Styles.textstyle13.copyWith(fontWeight: FontWeight.w900),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.keyboard_arrow_down),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                      Text(
                        product.quantity.toString(),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.keyboard_arrow_up),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
