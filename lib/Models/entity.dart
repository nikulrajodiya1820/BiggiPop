import 'dart:typed_data';

class CartModel {
  String label;
  String price;
  String image='';

  CartModel({
    this.label = '',
    this.price = '',
    required this.image,
  });

  static CartModel fromJson(Map json) {
    var layer = CartModel(
      label: json['label'],
      price: json['price'],
      image: json['image'],
    );
    return layer;
  }

  @override
  Map toJson() {
    return {
      'label': label,
      'price': price,
      'image': image,
    };
  }
}
