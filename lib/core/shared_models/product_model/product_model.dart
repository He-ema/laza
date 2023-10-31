import 'package:laza/constants.dart';

class ProductModel {
  final String name;
  final String image;
  final String description;
  final num price;
  final num quantity;

  ProductModel(
      {required this.name,
      required this.image,
      required this.description,
      required this.price,
      required this.quantity});

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      name: jsonData[kName],
      image: jsonData[kImage],
      description: jsonData[kDescription],
      price: jsonData[kPrice],
      quantity: jsonData[kQuantity],
    );
  }
}
