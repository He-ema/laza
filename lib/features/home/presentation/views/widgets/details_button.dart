import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/constants.dart';
import 'package:laza/features/home/data/product_model/product_model.dart';

import '../../../../../core/utils/widgets/custom_button.dart';
import '../../manager/cubit/details_cubit.dart';

class MyButtonDetails extends StatefulWidget {
  const MyButtonDetails(
      {super.key, required this.product, required this.email});
  final ProductModel product;
  final String email;
  @override
  State<MyButtonDetails> createState() => _MyButtonDetailsState();
}

class _MyButtonDetailsState extends State<MyButtonDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<DetailsCubit>(context)
        .checkExists(name: widget.product.name, email: widget.email);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        if (state is DetailsSuccess) {
          if (state.exists == true) {
            return CustomButton(
              text: 'Remove From Favourite',
              onPressed: () async {
                await BlocProvider.of<DetailsCubit>(context)
                    .handleAddingAndDeletionOfProduct(
                        email: widget.email, product: widget.product);
              },
            );
          } else {
            return CustomButton(
              text: 'Add to Favourite',
              onPressed: () async {
                await BlocProvider.of<DetailsCubit>(context)
                    .handleAddingAndDeletionOfProduct(
                        email: widget.email, product: widget.product);
              },
            );
          }
        } else if (state is DetailsFailure) {
          return Center(
            child: Text(state.errorMessage.toString()),
          );
        } else {
          return Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.1,
            color: kPrimaryColor,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
