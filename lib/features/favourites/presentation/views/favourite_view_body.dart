import 'package:flutter/material.dart';
import 'package:laza/constants.dart';
import 'package:laza/core/utils/styles.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: kTopSpace,
        ),
        Center(
          child: Column(
            children: [
              Container(
                color: Colors.red,
                child: Image.asset('assets/images/test.png'),
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
                  style:
                      Styles.textstyle13.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
