import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/features/home/presentation/manager/products_cubit/products_cubit.dart';

import '../../../../../core/utils/styles.dart';
import 'grei_item.dart';

class ItemsGridView extends StatefulWidget {
  const ItemsGridView({
    super.key,
    required this.email,
  });
  final String email;
  @override
  State<ItemsGridView> createState() => _ItemsGridViewState();
}

class _ItemsGridViewState extends State<ItemsGridView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ProductsCubit>(context).getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return GridView.builder(
            shrinkWrap: true,
            padding:
                const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 50),
            // shrinkWrap: true,
            itemCount: state.products.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //number of columns on the screen
              childAspectRatio: 0.6, // نسبىة العرض للطول
              crossAxisSpacing: 10, // spacing between columns
            ),
            itemBuilder: (context, index) {
              return GridItem(
                email: widget.email,
                product: state.products[index],
              );
            },
          );
        } else if (state is ProductsLoading) {
          return const Center(
            child: Text('Loading'),
          );
        } else {
          return const Center(
            child: Text('Error'),
          );
        }
      },
    );
  }
}
