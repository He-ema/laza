import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:laza/features/home/presentation/views/widgets/drawer.dart';
import 'package:laza/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: MyDrawer(
        email: email,
      ),
      body: HomeViewBody(email: email),
      // appBar: AppBar(),
    );
  }
}
