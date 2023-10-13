import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';

class DoesNotHaveAccountSection extends StatelessWidget {
  const DoesNotHaveAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Doesn\'t have an account ? ',
              style: Styles.textstyle15.copyWith(color: kGreyText),
            ),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).pushReplacement(AppRouter.SignUpRoute);
              },
              child: Text(
                'Sign Up ',
                style: Styles.textstyle15.copyWith(fontWeight: FontWeight.w500),
              ),
            )
          ],
        )
      ],
    );
  }
}
