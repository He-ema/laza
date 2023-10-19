import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza/constants.dart';
import 'package:laza/core/utils/widgets/custom_icon.dart';

import '../../../../../core/utils/asset_data.dart';
import '../../../../../core/utils/styles.dart';
import 'items_grid_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: CustomIcon(
            color: kPrimaryColor,
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            contetnt: SvgPicture.asset(AssetData.closedMenu,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black),
          ),
          backgroundColor: kPrimaryColor,
          floating: true,
          // automaticallyImplyLeading: false,
          pinned: true,
          // title: Text('Welcome To laza'),
          expandedHeight: MediaQuery.of(context).size.height * 0.20,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              color: kPrimaryColor,
            ),
            centerTitle: true,
            title: const Text('Laza'),
          ),
        ),
        const SliverToBoxAdapter(
          child: Expanded(
            child: ItemsGridView(),
          ),
        ),
      ],
    );
  }
}
