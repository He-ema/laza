import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/constants.dart';
import 'package:laza/core/utils/app_router.dart';
import 'package:laza/core/utils/asset_data.dart';
import 'package:laza/core/utils/styles.dart';
import 'package:laza/core/utils/widgets/custom_button.dart';
import 'package:laza/core/utils/widgets/custom_icon.dart';
import 'package:laza/features/get_started/presentation/views/widgets/social_container.dart';
import 'package:laza/core/utils/functions/show_awesome_dialouge.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/shared_cubits/auth_cubit/auth_cubit.dart';

class GetStartedViewBody extends StatefulWidget {
  const GetStartedViewBody({super.key});

  @override
  State<GetStartedViewBody> createState() => _GetStartedViewBodyState();
}

class _GetStartedViewBodyState extends State<GetStartedViewBody> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
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
          AuthCubit().close();
          isLoading = false;
          setState(() {});
          GoRouter.of(context).pushReplacement(AppRouter.BottomNavBarRoute,
              extra: BlocProvider.of<AuthCubit>(context).email);
        }

        if (state is AuthLoading) {
          isLoading = true;
          setState(() {});
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Stack(
          fit: StackFit.expand,
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
                    'Let’s Get Started',
                    style: Styles.textstyle28,
                  ),
                  const Spacer(),
                  const SocialContainer(
                      color: Color(0xff4267B2),
                      assetImage: AssetData.facebook,
                      text: 'Facebook'),
                  const SizedBox(
                    height: 10,
                  ),
                  const SocialContainer(
                      color: Color(0xff1DA1F2),
                      assetImage: AssetData.twitter,
                      text: 'Twitter'),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await BlocProvider.of<AuthCubit>(context)
                          .signInWithGoogle();
                    },
                    child: const SocialContainer(
                      color: Color(0xffEA4335),
                      assetImage: AssetData.google,
                      text: 'google',
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account ',
                        style: Styles.textstyle15.copyWith(
                          color: kGreyText,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.SignInRoute);
                        },
                        child: Text(
                          'SignIn',
                          style: Styles.textstyle15.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.11,
                  ),
                ],
              ),
            ),
            Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: CustomButton(
                  text: 'Create an account',
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.SignUpRoute);
                  },
                )),
          ],
        ),
      ),
    );
  }
}
