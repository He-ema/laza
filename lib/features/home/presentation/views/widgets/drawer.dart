import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:day_night_themed_switch/day_night_themed_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/constants.dart';
import 'package:laza/core/theme/theme.dart';
import 'package:laza/core/theme/theme_cubit/theme_cubit.dart';
import 'package:laza/core/utils/asset_data.dart';
import 'package:laza/core/utils/styles.dart';
import 'package:laza/core/utils/widgets/custom_icon.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: kTopSpace,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: CustomIcon(),
          ),
          SizedBox(
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
              Column(
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
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Text('3 Orders'),
              )
            ],
          ),
          ListTile(
            leading: const Icon(Icons.dark_mode_outlined),
            title: const Text('Dark Mode'),
            trailing: SizedBox(
              height: 20,
              child: ThemeSwitcher(
                builder: (context) => DayNightSwitch(
                  value: BlocProvider.of<ThemeCubit>(context).themeData ==
                          lightMode
                      ? false
                      : true,
                  onChanged: (value) {
                    BlocProvider.of<ThemeCubit>(context).toggleTheme();
                    ThemeSwitcher.of(context).changeTheme(
                        theme: BlocProvider.of<ThemeCubit>(context).themeData,
                        isReversed:
                            BlocProvider.of<ThemeCubit>(context).themeData ==
                                    darkMode
                                ? false
                                : true);
                  },
                ),
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.question_mark_sharp),
            title: const Text('marks'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
