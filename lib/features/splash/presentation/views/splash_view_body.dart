import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/core/utils/asset_data.dart';
import 'package:laza/core/utils/app_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  bool isVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 1),
      () {
        isVisible = true;
        setState(() {});
        Future.delayed(
          Duration(seconds: 3),
          () {
            GoRouter.of(context).pushReplacement(AppRouter.introRoute);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        curve: Curves.easeInExpo,
        duration: Duration(seconds: 2),
        opacity: isVisible ? 1 : 0,
        child: Image.asset(AssetData.logo),
      ),
    );
  }
}
