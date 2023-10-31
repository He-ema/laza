import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/shared_models/product_model/product_model.dart';
import 'package:laza/features/home/presentation/views/widgets/details_view_body.dart';

import '../manager/details_cubit/details_cubit.dart';

class DetailsView extends StatelessWidget {
  const DetailsView(
      {super.key,
      required this.product,
      required this.email,
      required this.changeColor});
  final ProductModel product;
  final String email;
  final VoidCallback changeColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocProvider(
        create: (context) => DetailsCubit(),
        child: DetailsViewBody(
          product: product,
          email: email,
          changeColor: changeColor,
        ),
      ),
    );
  }
}
