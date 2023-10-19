import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'grei_item.dart';

class ItemsGridView extends StatelessWidget {
  const ItemsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      shrinkWrap: true,
      itemCount: 6,
      physics: const BouncingScrollPhysics(),
      clipBehavior: Clip.none,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //number of columns on the screen
        childAspectRatio: 0.6, // نسبىة العرض للطول
        crossAxisSpacing: 10, // spacing between columns
      ),
      itemBuilder: (context, index) {
        return const GridItem();
      },
    );
  }
}