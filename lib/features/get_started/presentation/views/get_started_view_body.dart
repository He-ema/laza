import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/constants.dart';
import 'package:laza/core/utils/app_router.dart';
import 'package:laza/core/utils/asset_data.dart';
import 'package:laza/core/utils/styles.dart';
import 'package:laza/core/utils/widgets/custom_button.dart';
import 'package:laza/core/utils/widgets/custom_icon.dart';
import 'package:laza/features/get_started/presentation/views/widgets/social_container.dart';

class GetStartedViewBody extends StatelessWidget {
  const GetStartedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
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
              const SocialContainer(
                  color: Color(0xffEA4335),
                  assetImage: AssetData.google,
                  text: 'google'),
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
    );
  }
}
