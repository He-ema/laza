import 'package:flutter/material.dart';
import 'package:laza/core/utils/styles.dart';

class SocialContainer extends StatelessWidget {
  const SocialContainer(
      {super.key,
      required this.color,
      required this.assetImage,
      required this.text});
  final Color color;
  final String assetImage;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(assetImage),
          Text(
            text,
            style: Styles.textstyle17.copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
