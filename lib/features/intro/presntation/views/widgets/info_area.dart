import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/constants.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';
import 'buttons.dart';

class InfoArea extends StatelessWidget {
  const InfoArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Look Good, Feel Good',
                style: Styles.textstyle25,
                textAlign: TextAlign.center,
              ),
              Text(
                'Create your individual & unique style and look amazing everyday.',
                style: Styles.textstyle15.copyWith(color: kGreyText),
                textAlign: TextAlign.center,
              ),
              Buttons(),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.GetStartedViewRoute);
                },
                child: Text(
                  'Skip',
                  style: Styles.textstyle17.copyWith(color: kGreyText),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
