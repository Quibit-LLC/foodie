import 'package:get/get.dart';

class Dimensions{
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight/2.859;
  static double pageViewContainer = screenHeight/4.159;
  static double pageViewTextContainer = screenHeight/7.625;

//dynamic height padding and margin
  static double height10 = screenHeight/91.5;
  static double height15 = screenHeight/61;
  static double height20 = screenHeight/45.75;
  static double height30 = screenHeight/30.5;
  static double height45 = screenHeight/20.33;

//dynamic width padding and margin
  static double width10 = screenHeight/91.5;
  static double width15 = screenHeight/61;
  static double width20 = screenHeight/45.75;
  static double width30 = screenHeight/30.5;

// font size
  static double font16 = screenHeight/57.1875;
  static double font20 = screenHeight/45.75;
  static double font26 = screenHeight/35.1923;

//radius
  static double radius15 = screenHeight/61;
  static double radius20 = screenHeight/45.75;
  static double radius30 = screenHeight/30.5;

  // icon size
  static double iconSize24 = screenHeight/38.125;
  static double iconsSize16 = screenHeight/57.1875;

  // list view size
  static double listViewImgSize = screenWidth/3.43;
  static double listViewTextContSize = screenHeight/9.15;

  // popular food
  static double popularFoodImgSize = screenHeight/2.614;

  // bottom height
  static double bottomHeightBar = screenHeight/7.625;
}