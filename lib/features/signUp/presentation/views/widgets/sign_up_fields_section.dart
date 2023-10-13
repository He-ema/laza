import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/widgets/custom_text_form_field.dart';

class SignUpFiledsSection extends StatelessWidget {
  const SignUpFiledsSection(
      {super.key,
      required this.userNameController,
      required this.emailController,
      required this.passwordController,
      required this.formKey,
      required this.autovalidateMode});
  final TextEditingController userNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'UserName',
                style: Styles.textstyle13.copyWith(color: kGreyText),
              ),
            ],
          ),
          CustomTextFormField(controller: userNameController),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Text(
                'Email ',
                style: Styles.textstyle13.copyWith(color: kGreyText),
              ),
            ],
          ),
          CustomTextFormField(
            controller: emailController,
          ),
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
          CustomTextFormField(
            controller: passwordController,
          )
        ],
      ),
    );
  }
}
