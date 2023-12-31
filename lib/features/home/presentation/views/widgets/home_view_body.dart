import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/shared_cubits/products_cubit/products_cubit.dart';
import 'app_bar.dart';
import 'brands_list_view.dart';
import 'items_grid_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
    required this.email,
  });
  final String email;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const MyAppBar(),
        const SliverToBoxAdapter(
          child: BrandsListView(),
        ),
        SliverToBoxAdapter(
          child: Expanded(
            child: BlocProvider(
              create: (context) => ProductsCubit(),
              child: ItemsGridView(
                email: email,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
