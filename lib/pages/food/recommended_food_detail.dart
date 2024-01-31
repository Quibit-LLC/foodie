// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:foodie/controllers/cart_controller.dart';
import 'package:foodie/controllers/popular_product_controller.dart';
import 'package:foodie/controllers/recommended_product_controller.dart';
import 'package:foodie/pages/cart/cart_page.dart';
import 'package:foodie/routes/route_helper.dart';
import 'package:foodie/utils/app_constants.dart';
import 'package:foodie/utils/colors.dart';
import 'package:foodie/utils/dimensions.dart';
import 'package:foodie/widgets/app_icon.dart';
import 'package:foodie/widgets/big_text.dart';
import 'package:foodie/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  const RecommendedFoodDetail({
    Key? key,
    required this.pageId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
        Get.find<PopularProductController>().initProduct(product ,Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(icon: Icons.clear)),
             
                GetBuilder<PopularProductController>(builder: (controller){
              return Stack(
                children: [
                  AppIcon(icon: Icons.shopping_cart_checkout_outlined,),
                  Get.find<PopularProductController>().totalItems>=1?
                 Positioned(
                  right: 0,
                  top: 0,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(()=>CartPage());
                    },
                    child: AppIcon(icon: Icons.circle, size: 20, iconColor: Colors.transparent, backgroundColor: AppColors.mainColor,))):
                  Container(),
                  Get.find<PopularProductController>().totalItems>=1?
                 Positioned(
                  right: Dimensions.sizeSeven,
                  top: Dimensions.sizeTwo,
                  child: BigText(text: Get.find<PopularProductController>().totalItems.toString(),
                  size: 12,
                  color: Colors.white,
                  )):Container(),
                ],
              );
             }),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20), 
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  )
                ),                
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                child: Center(child: BigText(text: product.name!, size: Dimensions.font26,)),
              )),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!,
              width: double.maxFinite,
              fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                  child: ExpandableTextWidget(text: product.description!)),
              ],
            ),
          ),
        ],
      ),
    
    bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller){
      return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.only(left: Dimensions.width20*2.5, right: Dimensions.width20*2.5, top: Dimensions.height10, bottom: Dimensions.height10),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              GestureDetector(
              onTap: () {
                controller.setQuantity(false);
              },
              child: AppIcon(icon: Icons.remove, backgroundColor: AppColors.mainColor, iconColor: Colors.white,iconSize: Dimensions.iconSize24,)),
            BigText(text: "\$ ${product.price!}  X  ${controller.inCartItems} ", color: AppColors.mainBlackColor, size: Dimensions.font26),
            GestureDetector(
              onTap: () {
                controller.setQuantity(true);
              },
              child: AppIcon(icon: Icons.add, backgroundColor: AppColors.mainColor, iconColor: Colors.white,iconSize: Dimensions.iconSize24,)),
          ],
          ),
        ),

        Container(
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
              child: Icon(Icons.favorite, color: AppColors.mainColor),
            ),
            
            GestureDetector(
              onTap: () {
                controller.addItem(product);
              },
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.mainColor,
                ),
                child: BigText(text: "\$ ${product.price!} | Add to cart", color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      
      ],
    );
    })
    );
  }
}
