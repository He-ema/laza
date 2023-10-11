import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/constants.dart';
import 'package:laza/core/utils/app_router.dart';

import '../../../../../core/utils/styles.dart';

class Buttons extends StatefulWidget {
  const Buttons({
    super.key,
  });

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  bool? Man;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Man = true;
            setState(() {});
            Future.delayed(
              const Duration(seconds: 1),
              () {
                GoRouter.of(context).push(AppRouter.GetStartedViewRoute);
              },
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.35,
            height: MediaQuery.of(context).size.height * 0.09,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Man == true
                    ? kPrimaryColor
                    : Theme.of(context).colorScheme.secondary),
            child: const Center(
              child: Text(
                'Men',
                style: Styles.textstyle17,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Man = false;
            setState(() {});
            Future.delayed(
              const Duration(seconds: 1),
              () {
                GoRouter.of(context).push(AppRouter.GetStartedViewRoute);
              },
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.35,
            height: MediaQuery.of(context).size.height * 0.09,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Man == false
                    ? kPrimaryColor
                    : Theme.of(context).colorScheme.secondary),
            child: const Center(
              child: Text(
                'Women',
                style: Styles.textstyle17,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
