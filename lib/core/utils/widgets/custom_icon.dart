import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, this.contetnt});
  final Widget? contetnt;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(50),
          ),
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: contetnt ?? const Icon(Icons.arrow_back),
          ),
        )
      ],
    );
  }
}
