import 'package:flutter/material.dart';
import 'package:foodie/utils/colors.dart';
import 'package:foodie/utils/dimensions.dart';
import 'package:foodie/widgets/app_icon.dart';
import 'package:foodie/widgets/big_text.dart';
import 'package:foodie/widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
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
                child: Center(child: BigText(text: "Chinese Side", size: Dimensions.font26,)),
              )),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/image/food0.png",
              width: double.maxFinite,
              fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                  child: ExpandableTextWidget(text: "The chicken is first marinated with soy sauce for 30 minutes, then pan-fried until golden brown. It's then steamed with aromatic ingredients like Sichuan peppercorn, ginger, scallion, and cooking wine for 30-40 minutes. While the chicken cools down, cucumbers are prepared and a dressing is made from the broth collected from steaming the chicken, mixed with soy sauce, rice vinegar, black vinegar, sugar, minced garlic, and sesame oil. The dish is served with the chicken and smashed cucumber sections, drizzled with the savory dressing. The result is a well-balanced and appetizing dish that's perfect for a hot day. The chicken is first marinated with soy sauce for 30 minutes, then pan-fried until golden brown. It's then steamed with aromatic ingredients like Sichuan peppercorn, ginger, scallion, and cooking wine for 30-40 minutes. While the chicken cools down, cucumbers are prepared and a dressing is made from the broth collected from steaming the chicken, mixed with soy sauce, rice vinegar, black vinegar, sugar, minced garlic, and sesame oil. The dish is served with the chicken and smashed cucumber sections, drizzled with the savory dressing. The result is a well-balanced and appetizing dish that's perfect for a hot day. The chicken is first marinated with soy sauce for 30 minutes, then pan-fried until golden brown. It's then steamed with aromatic ingredients like Sichuan peppercorn, ginger, scallion, and cooking wine for 30-40 minutes. While the chicken cools down, cucumbers are prepared and a dressing is made from the broth collected from steaming the chicken, mixed with soy sauce, rice vinegar, black vinegar, sugar, minced garlic, and sesame oil. The dish is served with the chicken and smashed cucumber sections, drizzled with the savory dressing. The result is a well-balanced and appetizing dish that's perfect for a hot day. The chicken is first marinated with soy sauce for 30 minutes, then pan-fried until golden brown. It's then steamed with aromatic ingredients like Sichuan peppercorn, ginger, scallion, and cooking wine for 30-40 minutes. While the chicken cools down, cucumbers are prepared and a dressing is made from the broth collected from steaming the chicken, mixed with soy sauce, rice vinegar, black vinegar, sugar, minced garlic, and sesame oil. The dish is served with the chicken and smashed cucumber sections, drizzled with the savory dressing. The result is a well-balanced and appetizing dish that's perfect for a hot day.""The chicken is first marinated with soy sauce for 30 minutes, then pan-fried until golden brown. It's then steamed with aromatic ingredients like Sichuan peppercorn, ginger, scallion, and cooking wine for 30-40 minutes. While the chicken cools down, cucumbers are prepared and a dressing is made from the broth collected from steaming the chicken, mixed with soy sauce, rice vinegar, black vinegar, sugar, minced garlic, and sesame oil. The dish is served with the chicken and smashed cucumber sections, drizzled with the savory dressing. The result is a well-balanced and appetizing dish that's perfect for a hot day.")),
              ],
            ),
          ),
        ],
      ),
    
    bottomNavigationBar: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.only(left: Dimensions.width20*2.5, right: Dimensions.width20*2.5, top: Dimensions.height10, bottom: Dimensions.height10),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppIcon(icon: Icons.remove, backgroundColor: AppColors.mainColor, iconColor: Colors.white,iconSize: Dimensions.iconSize24,),
            BigText(text: "\$12.88  X  0 ", color: AppColors.mainBlackColor, size: Dimensions.font26),
            AppIcon(icon: Icons.add, backgroundColor: AppColors.mainColor, iconColor: Colors.white,iconSize: Dimensions.iconSize24,),
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
      
      ],
    ),
    );
  }
}