import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:laza/core/shared_models/product_model/product_model.dart';
import 'package:lottie/lottie.dart';

import '../../../../../constants.dart';
import '../../../../../core/shared_cubits/products_cubit/products_cubit.dart';
import '../../../../../core/stripe_payment/payment_manager.dart';
import '../../../../../core/utils/styles.dart';
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
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ProductsCubit>(context)
        .getFavouriteOrCartProducts(email: widget.email, isCart: true);
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
            int total = state.total!.toInt();
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
                      child: Row(
                        children: [
                          Text(
                            'Total : ${total} ',
                            style: Styles.textstyle17.copyWith(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.60,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: IconButton(
                              onPressed: () async {
                                if (await PaymentManager.makePayment(
                                    total, 'USD', context)) {
                                  CollectionReference payment =
                                      FirebaseFirestore.instance
                                          .collection('${widget.email}pay');
                                  payment.add({
                                    kTime: DateTime.now(),
                                    kTotal: total,
                                  });
                                  List<ProductModel> proList = state.products;
                                  CollectionReference cart = FirebaseFirestore
                                      .instance
                                      .collection(widget.email +
                                          kCartCollectionReference);
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  for (var element in proList) {
                                    await cart.doc(element.name).delete();
                                  }
                                  removeAllFromList(state);
                                }
                              },
                              icon: const Icon(
                                Icons.money_off_sharp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
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

  Future<void> removeAllFromList(ProductsSuccess state) async {
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
                color: Colors.green,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                  child: Text(
                'Success',
                style: Styles.textstyle17.copyWith(color: Colors.white),
              )),
            ),
          ),
        );
      },
      duration: const Duration(milliseconds: 2000),
    );
    Future.delayed(Duration(milliseconds: 2000), () {
      state.products.clear();
    });
  }

  Future<void> deleteListItem(int index, BuildContext context,
      ProductsSuccess state, String email) async {
    CollectionReference cart =
        FirebaseFirestore.instance.collection(email + kCartCollectionReference);
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
    await cart.doc(name).delete();
  }
}
