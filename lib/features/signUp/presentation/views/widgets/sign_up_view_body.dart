import 'package:flutter/material.dart';
import 'package:laza/constants.dart';
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
          child: Column(
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
              const Spacer(),
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
              const Spacer(
                flex: 2,
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
