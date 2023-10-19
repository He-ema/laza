import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class GridItem extends StatelessWidget {
  const GridItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image.asset(
            'assets/images/test.png',
            fit: BoxFit.fill,
          ),
        ),
        Container(
          width: 150,
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: const Text(
            'Nike Sportswear Club Fleece',
            style: Styles.textstyle11,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          width: 150,
          child: Text(
            '\$99',
            style: Styles.textstyle13.copyWith(fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
