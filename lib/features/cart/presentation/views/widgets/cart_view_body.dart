import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/constants.dart';
import 'package:laza/core/shared_cubits/products_cubit/products_cubit.dart';
import 'package:laza/core/utils/styles.dart';

import 'cart_list_view.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key, required this.email});
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
        Divider(
          height: 40,
          endIndent: 50,
          indent: 50,
        ),
        BlocProvider(
          create: (context) => ProductsCubit(),
          child: CartListView(email: email),
        ),
      ],
    );
  }
}
