import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'item.dart';

class ItemsGridView extends StatelessWidget {
  const ItemsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 6,
      physics: BouncingScrollPhysics(),
      clipBehavior: Clip.none,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //number of columns on the screen
        childAspectRatio: 0.6, // نسبىة العرض للطول
        crossAxisSpacing: 10, // spacing between columns
      ),
      itemBuilder: (context, index) {
        return Item();
      },
    );
  }
}
