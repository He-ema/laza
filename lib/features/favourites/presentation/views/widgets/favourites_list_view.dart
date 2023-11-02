import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';

import '../../../../../constants.dart';
import '../../../../../core/shared_cubits/products_cubit/products_cubit.dart';
import '../../../../../core/utils/styles.dart';
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
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
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
          if (state.products.length == 0) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/images/empty.json',
                  // width: 200,
                  // height: 200,
                  fit: BoxFit.fill,
                ),
                const Text(
                  'Your Favourite is Empty',
                  style: Styles.textstyle28,
                ),
              ],
            );
          } else {
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
                    child: AnimatedList(
                      key: _listKey,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      initialItemCount: state.products.length,
                      itemBuilder: (context, index, animation) => Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Slidable(
                          startActionPane: ActionPane(
                              motion: const BehindMotion(),
                              children: [
                                SlidableAction(
                                  label: 'Delete',
                                  onPressed: (context) async {
                                    await deleteListItem(
                                        index, context, state, widget.email);
                                  },
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
                  Positioned(
                      bottom: 5,
                      right: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: IconButton(
                          onPressed: () {
                            CollectionReference cart =
                                FirebaseFirestore.instance.collection(
                                    widget.email + kCartCollectionReference);
                            for (int i = 0; i < state.products.length; i++) {
                              cart.doc(state.products[i].name).set({
                                kName: state.products[i].name,
                                kImage: state.products[i].image,
                                kPrice: state.products[i].price,
                                kDescription: state.products[i].description,
                                kQuantity: state.products[i].quantity,
                                kTime: DateTime.now(),
                              });
                              CollectionReference favourite = FirebaseFirestore
                                  .instance
                                  .collection(widget.email +
                                      kFavouriteCollectionReference);
                              favourite.doc(state.products[i].name).delete();
                            }
                            removeAllFromList();
                          },
                          icon: const Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ],
              ),
            );
          }
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

  void removeAllFromList() {
    _listKey.currentState!.removeAllItems(
      (context, animation) {
        return SlideTransition(
          position: animation.drive(
              Tween(begin: const Offset(2, 0.0), end: const Offset(0.0, 0.0))
                  .chain(CurveTween(curve: Curves.elasticInOut))),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                  child: Text(
                'Added to cart',
                style: Styles.textstyle17.copyWith(color: Colors.white),
              )),
            ),
          ),
        );
      },
      duration: const Duration(milliseconds: 2000),
    );
  }

  Future<void> deleteListItem(int index, BuildContext context,
      ProductsSuccess state, String email) async {
    CollectionReference favourite = FirebaseFirestore.instance
        .collection(email + kFavouriteCollectionReference);
    String name = state.products[index].name;
    state.products.removeAt(index);

    _listKey.currentState!.removeItem(
      index,
      (context, animation) {
        return SlideTransition(
          position: animation.drive(
            Tween(begin: const Offset(2, 0.0), end: const Offset(0.0, 0.0))
                .chain(
              CurveTween(curve: Curves.elasticInOut),
            ),
          ),
          // sizeFactor: animation,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.5),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Center(child: Text('Deleted')),
            ),
          ),
        );
      },
      duration: const Duration(milliseconds: 2000),
    );
    await favourite.doc(name).delete();
  }
}
