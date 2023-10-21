import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza/core/utils/styles.dart';
import 'package:laza/features/home/presentation/views/widgets/search_text_field.dart';

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
          child: Center(
            child: Text(
              'Find all what you want',
              style: Styles.textstyle17
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Laza',
          style: Styles.textstyle25,
        ),
      ),
    );
  }
}
