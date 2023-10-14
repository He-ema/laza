import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/constants.dart';
import 'package:laza/core/shared_cubits/cubit/auth_cubit.dart';
import 'package:laza/core/utils/asset_data.dart';
import 'package:laza/core/utils/widgets/custom_button.dart';
import 'package:laza/core/utils/widgets/custom_icon.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';
import 'otp_item.dart';

class OtpViewBody extends StatefulWidget {
  const OtpViewBody({super.key});

  @override
  State<OtpViewBody> createState() => _OtpViewBodyState();
}

class _OtpViewBodyState extends State<OtpViewBody> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  EmailOTP myauth = EmailOTP();
  String OTPValue = '1234';
  bool isFalse = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myauth.setConfig(
        appEmail: "Laza@gmail.com",
        appName: "Laza",
        userEmail: BlocProvider.of<AuthCubit>(context).email,
        otpLength: 4,
        otpType: OTPType.digitsOnly);
    myauth.sendOTP();
  }

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
                'Verify account',
                style: Styles.textstyle28,
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Image.asset(AssetData.cloud),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OTPField(
                          controller: _controller,
                          isFalse: isFalse,
                          onSaved: (p0) {},
                          onChanged: (value) async {
                            if (value.length == 1) {
                              OTPValue = OTPValue.replaceRange(0, 1, value);
                              FocusScope.of(context).nextFocus();
                              await verify();
                            }
                          },
                        ),
                        OTPField(
                          controller: _controller2,
                          isFalse: isFalse,
                          onSaved: (p0) {},
                          onChanged: (value) async {
                            if (value.length == 1) {
                              OTPValue = OTPValue.replaceRange(1, 2, value);
                              FocusScope.of(context).nextFocus();
                              await verify();
                            }
                          },
                        ),
                        OTPField(
                          controller: _controller3,
                          isFalse: isFalse,
                          onSaved: (p0) {},
                          onChanged: (value) async {
                            if (value.length == 1) {
                              OTPValue = OTPValue.replaceRange(2, 3, value);
                              FocusScope.of(context).nextFocus();
                              await verify();
                            }
                          },
                        ),
                        OTPField(
                          controller: _controller4,
                          isFalse: isFalse,
                          onSaved: (p0) {},
                          onChanged: (value) async {
                            if (value.length == 1) {
                              OTPValue = OTPValue.replaceRange(3, 4, value);
                              FocusScope.of(context).nextFocus();
                              await verify();
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: CustomButton(
            text: 'Resend Code',
            onPressed: () async {
              await myauth.sendOTP();
            },
          ),
        ),
      ],
    );
  }

  Future<void> verify() async {
    if (_controller.text != '' &&
        _controller2.text != '' &&
        _controller3.text != '' &&
        _controller4.text != '') {
      if (await myauth.verifyOTP(otp: OTPValue) == true) {
        final CollectionReference users =
            FirebaseFirestore.instance.collection(kUsersCollectionReference);
        users.doc(BlocProvider.of<AuthCubit>(context).email).update({
          kVerified: true,
        });
        GoRouter.of(context).push(AppRouter.homeViewRoute,
            extra: BlocProvider.of<AuthCubit>(context).email);
      } else {
        _controller.clear();
        _controller2.clear();
        _controller3.clear();
        _controller4.clear();
        isFalse = true;
        setState(() {});
      }
    }
  }
}
