import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/shared_cubits/products_cubit/products_cubit.dart';
import '../../../../../core/utils/widgets/product_container.dart';
import '../../../../../core/utils/widgets/skelton.dart';

class CartListView extends StatefulWidget {
  const CartListView({
    super.key,
    required this.email,
  });
  final String email;
  @override
  State<CartListView> createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {
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
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kHorizontalPadding),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: state.products.length,
                    itemBuilder: (context, index) => ProductContainer(
                      product: state.products[index],
                      email: widget.email,
                      index: index,
                      startAnimation: startAnimation,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 100,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text('data'),
                  ),
                ),
              ],
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
