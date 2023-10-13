import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/constants.dart';
import 'package:laza/core/utils/app_router.dart';
import 'package:laza/core/utils/styles.dart';
import 'package:laza/core/utils/widgets/custom_button.dart';
import 'package:laza/core/utils/widgets/custom_icon.dart';
import 'package:laza/features/signUp/presentation/views/widgets/already_have_account_section.dart';
import 'package:laza/features/signUp/presentation/views/widgets/sign_up_fields_section.dart';

import '../../../../../core/utils/widgets/custom_text_form_field.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> _formKey = GlobalKey();
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
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    SignUpFiledsSection(
                      autovalidateMode: autovalidateMode,
                      formKey: _formKey,
                      userNameController: _controller,
                      emailController: _controller2,
                      passwordController: _controller3,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                    ),
                    AlreadyHaveAccountSection(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: CustomButton(
              text: 'Sign UP',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              }),
        ),
      ],
    );
  }
}
