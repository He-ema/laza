import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/asset_data.dart';
import '../../../../../core/utils/widgets/custom_icon.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      leading: CustomIcon(
        color: Colors.transparent,
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
        contetnt: SvgPicture.asset(AssetData.closedMenu, color: Colors.white),
      ),
      backgroundColor: kPrimaryColor,
      floating: true,
      // automaticallyImplyLeading: false,
      pinned: true,
      // title: Text('Welcome To laza'),
      expandedHeight: MediaQuery.of(context).size.height * 0.20,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: Theme.of(context).colorScheme.tertiary,
        ),
        centerTitle: true,
        title: const Text('Laza'),
      ),
    );
  }
}
