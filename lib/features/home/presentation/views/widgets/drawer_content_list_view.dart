import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza/features/home/presentation/views/widgets/theme_switching_list_tile.dart';

import '../../../../../constants.dart';
import '../../../../../core/theme/theme.dart';
import '../../../../../core/theme/theme_cubit/theme_cubit.dart';
import '../../../../../core/utils/asset_data.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/widgets/custom_icon.dart';
import 'drawer_info_list_tile.dart';

class Drawercontentlistview extends StatelessWidget {
  const Drawercontentlistview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const SizedBox(
          height: kTopSpace,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: CustomIcon(
            contetnt: SvgPicture.asset(AssetData.openedMenu,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const DrawerInfoListTile(),
        const ThemeSwitchingListTile(),
        ListTile(
          leading: const Icon(Icons.error_outline),
          title: const Text(
            'Account information',
            style: Styles.textstyle15,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: SvgPicture.asset(AssetData.lock,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black),
          title: const Text(
            'Password',
            style: Styles.textstyle15,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: SvgPicture.asset(AssetData.bag,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black),
          title: const Text(
            'Orders',
            style: Styles.textstyle15,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: SvgPicture.asset(AssetData.wallet,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black),
          title: const Text(
            'My Cards',
            style: Styles.textstyle15,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: SvgPicture.asset(AssetData.heart,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black),
          title: const Text(
            'WishList',
            style: Styles.textstyle15,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text(
            'Settings',
            style: Styles.textstyle15,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(
            Icons.logout,
            color: Colors.red,
          ),
          title: Text(
            'Logout',
            style: Styles.textstyle15.copyWith(color: Colors.red),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
