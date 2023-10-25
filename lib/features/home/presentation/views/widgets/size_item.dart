import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class SizeItem extends StatelessWidget {
  const SizeItem({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.16,
      height: MediaQuery.of(context).size.height * 0.09,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: Styles.textstyle17,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
