import 'package:flutter/material.dart';
import 'package:laza/constants.dart';
import 'package:laza/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});
  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: kPrimaryColor,
      minWidth: double.infinity,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Text(
        text,
        style: Styles.textstyle17.copyWith(color: Colors.white),
      ),
    );
  }
}
