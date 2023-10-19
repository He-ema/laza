import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza/constants.dart';

import '../../../../../core/utils/asset_data.dart';
import '../../../../../core/utils/styles.dart';

class BrandItem extends StatelessWidget {
  const BrandItem({
    super.key,
    this.isSelected = false,
    required this.name,
    required this.image,
  });
  final bool isSelected;
  final String name;
  final Widget image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 40,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSelected
            ? kPrimaryColor
            : Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.white
                  : Theme.of(context).colorScheme.tertiary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: image,
          ),
          const SizedBox(
            width: 5,
          ),
          const Text(
            'Adidas',
            style: Styles.textstyle15,
          ),
        ],
      ),
    );
  }
}
