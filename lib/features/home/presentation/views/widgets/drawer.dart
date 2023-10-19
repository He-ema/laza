import 'package:flutter/material.dart';

import 'drawer_content_list_view.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
    required this.email,
  });
  final String email;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Drawercontentlistview(email: email),
    );
  }
}
