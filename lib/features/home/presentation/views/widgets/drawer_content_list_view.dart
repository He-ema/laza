import 'package:flutter/material.dart';
import 'package:laza/features/home/presentation/views/widgets/theme_switching_list_tile.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/widgets/custom_icon.dart';
import 'drawer_info_list_tile.dart';

class Drawer_content_list_view extends StatelessWidget {
  const Drawer_content_list_view({
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
        const Padding(
          padding: EdgeInsets.only(left: 16),
          child: CustomIcon(),
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
          leading: const Icon(Icons.lock_outline_rounded),
          title: const Text(
            'Password',
            style: Styles.textstyle15,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.shopping_bag_outlined),
          title: const Text(
            'Orders',
            style: Styles.textstyle15,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.account_balance_wallet_outlined),
          title: const Text(
            'My Cards',
            style: Styles.textstyle15,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.favorite_border_rounded),
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
