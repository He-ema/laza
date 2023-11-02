import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../../constants.dart';
import '../../../../../core/shared_cubits/products_cubit/products_cubit.dart';
import '../../../../../core/utils/widgets/product_container.dart';
import '../../../../../core/utils/widgets/skelton.dart';

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
  bool startAnimation = false;
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
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            setState(() {
              startAnimation = true;
            });
          });
          return Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: state.products.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Slidable(
                    startActionPane:
                        ActionPane(motion: const BehindMotion(), children: [
                      SlidableAction(
                        label: 'Delete',
                        onPressed: (context) async {},
                        icon: Icons.delete,
                        backgroundColor: Colors.red,
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ]),
                    child: ProductContainer(
                      product: state.products[index],
                      email: widget.email,
                      index: index,
                      startAnimation: startAnimation,
                    ),
                  ),
                ),
              ),
            ),
          );
        } else if (state is ProductsFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 8,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(
                    bottom: 20,
                    left: kHorizontalPadding,
                    right: kHorizontalPadding),
                child: Skelton(
                  width: double.infinity,
                  height: 150,
                  opacity: 0.1,
                  borderRaduis: 15,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
