import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, this.contetnt, this.onTap, this.color});
  final Widget? contetnt;
  final void Function()? onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: color ?? Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(50),
          ),
          child: GestureDetector(
            onTap: onTap ??
                () {
                  contetnt == null ? GoRouter.of(context).pop() : null;
                },
            child: contetnt ?? const Icon(Icons.arrow_back),
          ),
        )
      ],
    );
  }
}
