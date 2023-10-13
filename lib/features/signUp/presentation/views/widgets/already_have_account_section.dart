import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';

class AlreadyHaveAccountSection extends StatelessWidget {
  const AlreadyHaveAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account ? ',
          style: Styles.textstyle15.copyWith(color: kGreyText),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pushReplacement(AppRouter.SignInRoute);
          },
          child: Text(
            'Sign In ',
            style: Styles.textstyle15.copyWith(fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
