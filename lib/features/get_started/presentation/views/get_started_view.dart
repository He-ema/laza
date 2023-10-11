import 'package:flutter/material.dart';
import 'package:laza/features/get_started/presentation/views/get_started_view_body.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: GetStartedViewBody(),
    );
  }
}
