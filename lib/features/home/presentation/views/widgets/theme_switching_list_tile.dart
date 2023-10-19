import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:day_night_themed_switch/day_night_themed_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/utils/styles.dart';

import '../../../../../core/theme/theme.dart';
import '../../../../../core/theme/theme_cubit/theme_cubit.dart';

class ThemeSwitchingListTile extends StatelessWidget {
  const ThemeSwitchingListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeSwitcher(
      builder: (context) => ListTile(
        leading: const Icon(Icons.dark_mode_outlined),
        title: const Text(
          'Dark Mode',
          style: Styles.textstyle15,
        ),
        trailing: SizedBox(
          height: 20,
          child: ThemeSwitcher(
            builder: (context) => DayNightSwitch(
              value: BlocProvider.of<ThemeCubit>(context).themeData == lightMode
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
        onTap: () {
          BlocProvider.of<ThemeCubit>(context).toggleTheme();
          ThemeSwitcher.of(context).changeTheme(
              theme: BlocProvider.of<ThemeCubit>(context).themeData,
              isReversed:
                  BlocProvider.of<ThemeCubit>(context).themeData == darkMode
                      ? false
                      : true);
        },
      ),
    );
  }
}
