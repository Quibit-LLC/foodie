import 'package:flutter/material.dart';
import 'package:foodie/controllers/cart_controller.dart';
import 'package:foodie/controllers/popular_product_controller.dart';
import 'package:foodie/controllers/recommended_product_controller.dart';
import 'package:foodie/pages/home/main_food_page.dart';
import 'package:foodie/routes/route_helper.dart';
import 'package:foodie/utils/app_constants.dart';
import 'package:foodie/utils/colors.dart';
import 'package:foodie/utils/dimensions.dart';
import 'package:foodie/widgets/app_icon.dart';
import 'package:foodie/widgets/big_text.dart';
import 'package:foodie/widgets/small_text.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20 * 3,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               AppIcon(icon: Icons.arrow_back_ios_new,
              iconColor: Colors.white,
              backgroundColor: AppColors.mainColor,
              iconSize: Dimensions.iconSize24,
              ),
              SizedBox(width: Dimensions.width20*5),
                GestureDetector(
                  onTap: () {
                     Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(icon: Icons.home_outlined,
                                iconColor: Colors.white,
                                backgroundColor: AppColors.mainColor,
                                iconSize: Dimensions.iconSize24,
                                ),
                ),
                AppIcon(icon: Icons.shopping_cart,
              iconColor: Colors.white,
              backgroundColor: AppColors.mainColor,
              iconSize: Dimensions.iconSize24,
              ),
             ],
          ),
          ),
          Positioned(
            top: Dimensions.height20 * 5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height15),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(builder: (cartController){
                  var _cartList = cartController.getItems;
                  return ListView.builder(
                  itemCount: _cartList.length,
                  itemBuilder: ((context, index) {
                  return Container(
                    height: Dimensions.height20 * 5,
                     width: double.maxFinite,
                     child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            var popularIndex = Get.find<PopularProductController>().popularProductList.indexOf(_cartList[index].product!);
                          
                          if(popularIndex>=0){
                            Get.toNamed(RouteHelper.getPopularFood(popularIndex, "cartPage"));
                          }
                          else{
                             var recommendedIndex = Get.find<RecommendedProductController>().recommendedProductList.indexOf(_cartList[index].product!);

                              Get.toNamed(RouteHelper.getRecommendedFood(recommendedIndex, "cartPage"));
                          }
                          },
                          child: Container(
                            width: Dimensions.height20 * 5,
                            height: Dimensions.height20 * 5,
                            margin: EdgeInsets.only(bottom: Dimensions.height10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  AppConstants.BASE_URL+AppConstants.UPLOAD_URL+cartController.getItems[index].img!
                                )
                                ),
                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: Dimensions.width10,),
                        Expanded(
                          child: Container(
                            height: Dimensions.height20 * 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                BigText(text: cartController.getItems[index].name!, color: Colors.black54,),
                                SmallText(text: "Spicy"),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    BigText(text: "\$${cartController.getItems[index].price!}", color: Colors.redAccent,),
                                     Container(
              padding: EdgeInsets.only(top: Dimensions.height10, bottom: Dimensions.height10, left: Dimensions.width20, right: Dimensions.width20,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: Row(
                
                children: [
                  GestureDetector(
                    onTap: () {
                      cartController.addItem(_cartList[index].product!, -1);
                    },
                    child: Icon(Icons.remove, color: AppColors.signColor)),
                  SizedBox(width: Dimensions.width10/2,),
                  BigText(text: _cartList[index].quantity.toString()),//popularProduct.inCartItems.toString()),
                  SizedBox(width: Dimensions.width10/2,),
                  GestureDetector(
                    onTap: () {
                     cartController.addItem(_cartList[index].product!, 1);
                    },
                    child: Icon(Icons.add, color: AppColors.signColor)),
                ],
              ),
            ),
                                  ],
                                ),
                              ],
                            ),
                          ),),
                      ],
                     ),
                  );
                }));
                })
              ),
            ),
          ),
        ],
      ),
       bottomNavigationBar: GetBuilder<CartController>(builder: (cartController){
        return Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, right: Dimensions.width20, left: Dimensions.width20),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20 *2),
            topRight: Radius.circular(Dimensions.radius20 *2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.height10, bottom: Dimensions.height10, left: Dimensions.width20, right: Dimensions.width20,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: Row(
                
                children: [
                  SizedBox(width: Dimensions.width10/2,),
                  BigText(text: "\$ ${cartController.totalAmount}"),
                  SizedBox(width: Dimensions.width10/2,),
                  
                ],
              ),
            ),
            
            GestureDetector(
              onTap: () {
                // popularProduct.addItem(product);
              },
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.mainColor,
                ),
               
                  child: GestureDetector(
                    onTap: () {
                      cartController.addToHistory();
                    },
                    child: BigText(text: " Check Out", color: Colors.white))
              ),
            ),
          ],
        ),
      );
      })
    
    );
  }
}