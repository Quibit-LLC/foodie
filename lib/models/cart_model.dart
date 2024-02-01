// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:foodie/models/products_model.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExists;
  String? time;
  ProductModel? product;

  CartModel({
    this.id,
    this.name,
    this.price,
    this.img,
    this.quantity,
    this.isExists,
    this.time,
    this.product,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity=json["quantity"];
    price = json['price'];
    isExists = json["isExists"];
    time = json["time"];
    img = json['img'];
    product=ProductModel.fromJson(json["product"]);
 
  }
}
