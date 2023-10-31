import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/constants.dart';
import 'package:laza/core/utils/app_router.dart';
import 'package:laza/core/shared_models/product_model/product_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../../core/utils/styles.dart';
import '../details_view.dart';

class GridItem extends StatefulWidget {
  const GridItem({
    super.key,
    required this.product,
    required this.email,
  });
  final String email;
  final ProductModel product;

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userFavourite = FirebaseFirestore.instance
        .collection(widget.email + kFavouriteCollectionReference);
    changeColor();
  }

  @override
  void changeColor() async {
    await getColor();
  }

  late CollectionReference userFavourite;
  Color color = Colors.black;
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return DetailsView(
                product: widget.product,
                email: widget.email,
                changeColor: changeColor,
              );
            }));
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: widget.product.name,
                    child: CachedNetworkImage(
                      imageUrl: widget.product.image,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 200,
                        child: SpinKitSpinningLines(
                            color: Theme.of(context).colorScheme.tertiary),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  widget.product.name,
                  style: Styles.textstyle11,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: 150,
                child: Text(
                  '\$${widget.product.price}',
                  style:
                      Styles.textstyle13.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: GestureDetector(
            onTap: () async {
              await handleAddingAndDeletionOfProduct();
            },
            child: Icon(
              Icons.favorite_rounded,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> handleAddingAndDeletionOfProduct() async {
    var data = await userFavourite.doc(widget.product.name).get().then((doc) {
      if (doc.exists) {
        userFavourite.doc(widget.product.name).delete();
      } else {
        userFavourite.doc(widget.product.name).set({
          kName: widget.product.name,
          kImage: widget.product.image,
          kPrice: widget.product.price,
          kQuantity: 1,
          kTime: DateTime.now(),
        });
      }
    });

    color == kPrimaryColor ? color = Colors.black : color = kPrimaryColor;
    setState(() {});
  }

  Future<void> getColor() async {
    var data = await userFavourite.doc(widget.product.name).get().then((doc) {
      if (doc.exists) {
        color = kPrimaryColor;
        if (mounted) {
          setState(() {});
        }
      } else {
        color = Colors.black;
        if (mounted) {
          setState(() {});
        }
      }
    });
  }
}
