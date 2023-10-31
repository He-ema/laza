import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/constants.dart';
import 'package:laza/core/shared_cubits/products_cubit/products_cubit.dart';
import 'package:laza/core/utils/styles.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: kTopSpace,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Favourites',
              style: Styles.textstyle17,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        BlocProvider(
          create: (context) => ProductsCubit(),
          child: FavouritesListView(email: email),
        ),
      ],
    );
  }
}

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
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: 200,
                  height: 200,
                  color: kPrimaryColor,
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
