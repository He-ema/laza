import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/asset_data.dart';
import '../../../../../core/utils/styles.dart';

class DrawerInfoListTile extends StatelessWidget {
  const DrawerInfoListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.background,
          radius: 45,
          child: Image.asset(AssetData.man),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 120,
              child: Text(
                'Hema Osama',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Styles.textstyle17,
              ),
            ),
            Row(
              children: [
                const Text(
                  'Verified Account',
                  style: Styles.textstyle13,
                ),
                SvgPicture.asset(AssetData.verified),
              ],
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: const Text('3 Orders'),
        )
      ],
    );
  }
}
