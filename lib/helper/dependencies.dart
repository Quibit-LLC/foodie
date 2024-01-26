import 'package:foodie/controllers/popular_product_controller.dart';
import 'package:foodie/data/api/api_client.dart';
import 'package:foodie/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async{
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: "https://mvs.bslmeiyu.com"));

// repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  // controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}