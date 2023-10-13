import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/widgets/custom_text_form_field.dart';

class FieldsSection extends StatefulWidget {
  const FieldsSection(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.formKey,
      required this.autovalidateMode});
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;

  @override
  State<FieldsSection> createState() => _FieldsSectionState();
}

class _FieldsSectionState extends State<FieldsSection> {
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: widget.autovalidateMode,
      key: widget.formKey,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Email',
                style: Styles.textstyle13.copyWith(color: kGreyText),
              ),
            ],
          ),
          CustomTextFormField(controller: widget.emailController),
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
          CustomTextFormField(controller: widget.passwordController),
        ],
      ),
    );
  }
}
