import 'package:foodie/models/cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo{
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart=[];

  void addToCartList(List<CartModel> cartList){
    
  }

}