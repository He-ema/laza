import 'package:flutter/material.dart';
import 'package:laza/features/otp/presentaion/views/widgets/otp_view_body.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: OtpViewBody(),
    );
  }
}
