import 'package:flutter/material.dart';
import 'package:foodie/utils/colors.dart';
import 'package:foodie/utils/dimensions.dart';
import 'package:foodie/widgets/app_column.dart';
import 'package:foodie/widgets/app_icon.dart';
import 'package:foodie/widgets/big_text.dart';
import 'package:foodie/widgets/expandable_text_widget.dart';
import 'package:foodie/widgets/icon_and_text_widget.dart';
import 'package:foodie/widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/food0.png"),
                  ),
              ),
            ), 
            ),
        // icon widgets
        Positioned(
          top: Dimensions.height45,
          left: Dimensions.width20,
          right: Dimensions.width20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppIcon(icon: Icons.arrow_back_ios_new),
             AppIcon(icon: Icons.shopping_cart_checkout_outlined),
          ],
          ),
          ),
       
       // introduction of food
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          top: Dimensions.popularFoodImgSize-20,
          child: Container(
            padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20,),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(Dimensions.radius20),
                topLeft: Radius.circular(Dimensions.radius20),
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppColumn(text: "Chinese Side"),
                SizedBox(height: Dimensions.height20,),
                BigText(text: "Introduction"),

                //  expandable text widget
                SizedBox(height: Dimensions.height10,),
                Expanded(
                  child: SingleChildScrollView(
                  child: ExpandableTextWidget(
                    text: "The chicken is first marinated with soy sauce for 30 minutes, then pan-fried until golden brown. It's then steamed with aromatic ingredients like Sichuan peppercorn, ginger, scallion, and cooking wine for 30-40 minutes. While the chicken cools down, cucumbers are prepared and a dressing is made from the broth collected from steaming the chicken, mixed with soy sauce, rice vinegar, black vinegar, sugar, minced garlic, and sesame oil. The dish is served with the chicken and smashed cucumber sections, drizzled with the savory dressing. The result is a well-balanced and appetizing dish that's perfect for a hot day."),
                    ),
                    ),
              ],
            ),
        ),
        ),
        
        


        ],
      ),
      bottomNavigationBar: Container(
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
                  Icon(Icons.remove, color: AppColors.signColor,),
                  SizedBox(width: Dimensions.width10/2,),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width10/2,),
                  Icon(Icons.add, color: AppColors.signColor),
                ],
              ),
            ),
            
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor,
              ),
              child: BigText(text: "\$10 | Add to cart", color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}