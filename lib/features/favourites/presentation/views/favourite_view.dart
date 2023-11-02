import 'package:flutter/material.dart';

import 'widgets/favourite_view_body.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: FavouriteViewBody(
        email: email,
      ),
    );
  }
}
