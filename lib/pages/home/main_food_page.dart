import 'package:flutter/material.dart';
import 'package:foodie/pages/home/food_page_body.dart';
import 'package:foodie/utils/colors.dart';
import 'package:foodie/utils/dimensions.dart';
import 'package:foodie/widgets/big_text.dart';
import 'package:foodie/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
      child: Container(
        margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
        padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                BigText(text: "USA", color: AppColors.mainColor,),
                Row(
                  children: [
                    SmallText(text: "Pittsburgh", color: Colors.black54,),
                    Icon(Icons.arrow_drop_down_rounded),
                  ],
                )
              ],
            ),
            Center(
              child: Container(
                width: Dimensions.height45,
                height: Dimensions.height45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  color: AppColors.mainColor,
                ),
                child: Icon(Icons.search, color: Colors.white, size: Dimensions.iconSize24,),
              ),
            ),
          ],
        ),
      ),
    ),
    Expanded(
      child: SingleChildScrollView(
        child: MediaQuery.removePadding(
          context: context,
            removeTop: true,
          child: FoodPageBody())
        ),
        ),
        ],
      ),
    );
  }
}