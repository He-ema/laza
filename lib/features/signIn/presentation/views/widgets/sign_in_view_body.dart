import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/features/signIn/presentation/views/widgets/sign_in_fields_section.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../../core/utils/widgets/custom_icon.dart';
import '../../../../../core/utils/widgets/custom_text_form_field.dart';
import 'does_not_have_an_account_section.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _controller2.dispose();
  }

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
                'Sign In',
                style: Styles.textstyle28,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              FieldsSection(
                emailController: _controller,
                passwordController: _controller2,
                autovalidateMode: autovalidateMode,
                formKey: _formKey,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.36,
              ),
              DoesNotHaveAccountSection(),
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
          child: CustomButton(
            text: 'Sign In',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
        ),
      ],
    );
  }
}
