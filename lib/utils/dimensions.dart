import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.64;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;


  //dynamic height
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height40 = screenHeight / 21.1;
  static double height45 = screenHeight / 18.76;

  //dynamic width margin and padding
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;

  //Slider Don Size
  static double slideDotHeight = screenHeight / 98.2;

  static double font12 = screenHeight / 70.33;
  static double font14 = screenHeight / 63.14;
  static double font16 = screenHeight / 52.75;
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.46;

  //Border Radius
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

  //Icon Size
  static double iconSize24 = screenHeight / 35.17;
  static double iconSize16 = screenHeight / 52.75;

  //List view image size
  static double listViewImageSize = screenHeight / 7.36; // 390/3.25 = 120
  static double listViewTextContSize = screenHeight / 8.84; // 390/3.9 = 100

  //popular food page
  static double popularFoodImageSize = screenHeight / 2.41;

  //bottom height
  static var bottomHeightBar = screenHeight / 7.03; // 844/7.03 = 120

}
