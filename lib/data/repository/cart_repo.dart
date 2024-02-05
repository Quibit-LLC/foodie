import 'dart:convert';

import 'package:foodie/models/cart_model.dart';
import 'package:foodie/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo{
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart=[];

  void addToCartList(List<CartModel> cartList){
    cart=[];

    //  convert objects to string because sharedPref only accepts strings

    // cartList.forEach((element) {
    //   return cart.add(jsonEncode(element));
    // });
    cartList.forEach((element)=>cart.add(jsonEncode(element)));

    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    // print(sharedPreferences.getStringList(AppConstants.CART_LIST));
    getCartList();

  }

  List<CartModel> getCartList(){
    List<String> carts = [];
    if(sharedPreferences.containsKey(AppConstants.CART_LIST)){
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      print("Inside getCartList: $carts");
    }
    List<CartModel> cartList = [];

    carts.forEach((element)=>cartList.add(CartModel.fromJson(jsonDecode(element))));
    
    return cartList;
  }
}