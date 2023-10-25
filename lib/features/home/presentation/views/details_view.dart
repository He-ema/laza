import 'package:flutter/material.dart';
import 'package:laza/features/home/data/product_model/product_model.dart';
import 'package:laza/features/home/presentation/views/widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: DetailsViewBody(product: product),
    );
  }
}
