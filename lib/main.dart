import 'package:flutter/material.dart';
import 'package:foodie/controllers/popular_product_controller.dart';
import 'package:foodie/controllers/recommended_product_controller.dart';
import 'package:foodie/pages/home/main_food_page.dart';
import 'package:foodie/routes/route_helper.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep; 
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MainFoodPage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}

