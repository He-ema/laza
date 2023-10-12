import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/constants.dart';
import 'package:laza/core/utils/app_router.dart';
import 'package:laza/core/utils/styles.dart';
import 'package:laza/core/utils/widgets/custom_button.dart';
import 'package:laza/core/utils/widgets/custom_icon.dart';

import '../../../../../core/utils/widgets/custom_text_form_field.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(
                height: kTopSpace,
              ),
              const CustomIcon(),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Sign Up',
                style: Styles.textstyle28,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Row(
                children: [
                  Text(
                    'UserName',
                    style: Styles.textstyle13.copyWith(color: kGreyText),
                  ),
                ],
              ),
              const CustomTextFormField(),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Text(
                    'Password',
                    style: Styles.textstyle13.copyWith(color: kGreyText),
                  ),
                ],
              ),
              const CustomTextFormField(),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Text(
                    'Email Address',
                    style: Styles.textstyle13.copyWith(color: kGreyText),
                  ),
                ],
              ),
              const CustomTextFormField(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account ? ',
                    style: Styles.textstyle15.copyWith(color: kGreyText),
                  ),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context)
                          .pushReplacement(AppRouter.SignInRoute);
                    },
                    child: Text(
                      'Sign In ',
                      style: Styles.textstyle15
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: CustomButton(text: 'Sign UP', onPressed: () {}),
        ),
      ],
    );
  }
}
