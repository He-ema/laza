import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza/core/utils/asset_data.dart';

import 'brand_item.dart';

class BrandsListView extends StatefulWidget {
  const BrandsListView({
    super.key,
  });

  @override
  State<BrandsListView> createState() => _BrandsListViewState();
}

class _BrandsListViewState extends State<BrandsListView> {
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
            onTap: () {
              selectedItem = 0;
              setState(() {});
            },
            child: BrandItem(
              isSelected: selectedItem == 0 ? true : false,
              image: SvgPicture.asset(
                AssetData.adidas,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
              name: 'Adidas',
            ),
          ),
          GestureDetector(
            onTap: () {
              selectedItem = 1;
              setState(() {});
            },
            child: BrandItem(
              isSelected: selectedItem == 1 ? true : false,
              image: SvgPicture.asset(
                AssetData.puma,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
              name: 'Puma',
            ),
          ),
          GestureDetector(
            onTap: () {
              selectedItem = 2;
              setState(() {});
            },
            child: BrandItem(
              isSelected: selectedItem == 2 ? true : false,
              image: SvgPicture.asset(
                AssetData.nike,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
              name: 'Nike',
            ),
          ),
          GestureDetector(
            onTap: () {
              selectedItem = 3;
              setState(() {});
            },
            child: BrandItem(
              isSelected: selectedItem == 3 ? true : false,
              image: SvgPicture.asset(
                AssetData.fila,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
              name: 'Fila',
            ),
          ),
        ],
      ),
    );
  }
}
