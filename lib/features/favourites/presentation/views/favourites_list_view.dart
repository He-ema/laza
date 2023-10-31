import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants.dart';
import '../../../../core/shared_cubits/products_cubit/products_cubit.dart';
import '../../../../core/utils/widgets/product_container.dart';

class FavouritesListView extends StatefulWidget {
  const FavouritesListView({
    super.key,
    required this.email,
  });
  final String email;
  @override
  State<FavouritesListView> createState() => _FavouritesListViewState();
}

class _FavouritesListViewState extends State<FavouritesListView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ProductsCubit>(context)
        .getFavouriteOrCartProducts(email: widget.email);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
              child: ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) => ProductContainer(
                  product: state.products[index],
                  email: widget.email,
                ),
              ),
            ),
          );
        } else if (state is ProductsFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const Center(
            child: Text('Loading'),
          );
        }
      },
    );
  }
}
