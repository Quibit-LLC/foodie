// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExists;
  String? time;


 

  CartModel({
    this.id,
    this.name,
    this.price,
    this.img,
    this.quantity,
    this.isExists,
    this.time,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity=json["quantity"];
    price = json['price'];
    isExists = json["isExists"];
    time = json["time"];
    img = json['img'];
 
  }
}
