import 'package:flutter/material.dart';

import 'app_bar.dart';
import 'brands_list_view.dart';
import 'items_grid_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        MyAppBar(),
        SliverToBoxAdapter(
          child: BrandsListView(),
        ),
        SliverToBoxAdapter(
          child: Expanded(
            child: ItemsGridView(),
          ),
        ),
      ],
    );
  }
}
