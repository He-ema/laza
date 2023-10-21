import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/features/home/presentation/manager/products_cubit/products_cubit.dart';

import 'app_bar.dart';
import 'brands_list_view.dart';
import 'items_grid_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const MyAppBar(),
        const SliverToBoxAdapter(
          child: BrandsListView(),
        ),
        SliverToBoxAdapter(
          child: Expanded(
            child: BlocProvider(
              create: (context) => ProductsCubit(),
              child: const ItemsGridView(),
            ),
          ),
        ),
      ],
    );
  }
}
