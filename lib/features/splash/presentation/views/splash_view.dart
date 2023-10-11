import 'package:flutter/material.dart';
import 'package:laza/features/splash/presentation/views/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      body: SplashViewBody(),
    );
  }
}
