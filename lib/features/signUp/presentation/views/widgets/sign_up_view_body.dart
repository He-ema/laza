import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/constants.dart';
import 'package:laza/core/utils/app_router.dart';
import 'package:laza/core/utils/functions/show_awesome_dialouge.dart';
import 'package:laza/core/utils/styles.dart';
import 'package:laza/core/utils/widgets/custom_button.dart';
import 'package:laza/core/utils/widgets/custom_icon.dart';
import 'package:laza/features/signUp/presentation/views/widgets/already_have_account_section.dart';
import 'package:laza/features/signUp/presentation/views/widgets/sign_up_fields_section.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/shared_cubits/auth_cubit/auth_cubit.dart';
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
  bool isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _controller2.dispose();
    _controller3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          isLoading = true;
          setState(() {});
        }
        if (state is AuthFailure) {
          isLoading = false;
          setState(() {});
          ShowAwesomeDialouge(
              context: context,
              body: state.erroHeader,
              desctiption: state.errorMessage,
              dialogType: DialogType.error);
        }
        if (state is AuthSuccess) {
          isLoading = false;
          setState(() {});
          GoRouter.of(context).push(AppRouter.otpViewRoute);
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
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
                        const AlreadyHaveAccountSection(),
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
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await BlocProvider.of<AuthCubit>(context).signUpwithEmail(
                          email: _controller2.text,
                          password: _controller3.text,
                          name: _controller.text);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
