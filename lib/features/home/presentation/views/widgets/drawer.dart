import 'package:flutter/material.dart';
import 'package:laza/constants.dart';
import 'package:laza/core/utils/asset_data.dart';
import 'package:laza/core/utils/styles.dart';
import 'package:laza/core/utils/widgets/custom_icon.dart';
import 'package:laza/features/home/presentation/views/widgets/theme_switching_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: ListView(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.background,
                radius: 45,
                child: Image.asset(AssetData.man),
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hema Osama',
                    style: Styles.textstyle17,
                  ),
                  Text(
                    'Verified Account',
                    style: Styles.textstyle13,
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: const Text('3 Orders'),
              )
            ],
          ),
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
      ),
    );
  }
}
