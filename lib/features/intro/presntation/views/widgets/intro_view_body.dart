import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/theme/theme.dart';
import 'package:laza/core/theme/theme_cubit/theme_cubit.dart';
import 'package:laza/core/utils/asset_data.dart';
import 'package:laza/features/intro/presntation/views/widgets/info_area.dart';

class IntroViewBody extends StatelessWidget {
  const IntroViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(AssetData.man),
        Positioned(
          right: 0,
          left: 0,
          bottom: 0,
          child: InfoArea(),
        ),
        Positioned(
          top: 45,
          right: 20,
          child: ThemeSwitcher(
            builder: (context) => IconButton(
                onPressed: () {
                  BlocProvider.of<ThemeCubit>(context).toggleTheme();
                  ThemeSwitcher.of(context).changeTheme(
                      theme: BlocProvider.of<ThemeCubit>(context).themeData,
                      isReversed:
                          BlocProvider.of<ThemeCubit>(context).themeData ==
                                  darkMode
                              ? false
                              : true);
                },
                icon: Icon(
                    BlocProvider.of<ThemeCubit>(context).themeData == darkMode
                        ? Icons.sunny
                        : Icons.dark_mode)),
          ),
        ),
      ],
    );
  }
}
