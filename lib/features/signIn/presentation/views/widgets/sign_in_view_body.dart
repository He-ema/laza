import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/core/utils/functions/show_awesome_dialouge.dart';
import 'package:laza/features/signIn/presentation/views/widgets/sign_in_fields_section.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../constants.dart';
import '../../../../../core/shared_cubits/auth_cubit/auth_cubit.dart';
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
  bool isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _controller2.dispose();
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
        }
        if (state is AuthSuccess) {
          isLoading = false;
          setState(() {});
          if (BlocProvider.of<AuthCubit>(context).verified == true) {
            GoRouter.of(context).pushReplacement(AppRouter.BottomNavBarRoute,
                extra: BlocProvider.of<AuthCubit>(context).email);
          } else {
            ShowAwesomeDialouge(
                context: context,
                body: 'Alert',
                desctiption: 'This email isn\'t verified',
                dialogType: DialogType.warning,
                btnOkOnPress: () {
                  Future.delayed(Duration(seconds: 1), () {
                    GoRouter.of(context).push(AppRouter.otpViewRoute);
                  });
                });
          }
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
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
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await BlocProvider.of<AuthCubit>(context)
                        .loginWithEmailAndPassword(
                            email: _controller.text,
                            password: _controller2.text);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
