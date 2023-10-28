import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/features/home/data/product_model/product_model.dart';
import 'package:laza/features/home/presentation/manager/cubit/details_cubit.dart';
import 'package:laza/features/home/presentation/views/widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.product, required this.email});
  final ProductModel product;
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocProvider(
        create: (context) => DetailsCubit(),
        child: DetailsViewBody(
          product: product,
          email: email,
        ),
      ),
    );
  }
}
