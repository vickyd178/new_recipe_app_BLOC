import 'package:get/get.dart';
import 'package:new_recipe_app/controllers/CategoryController.dart';
import 'package:new_recipe_app/controllers/HomePageController.dart';
import 'package:new_recipe_app/controllers/meals_controller.dart';
import 'package:new_recipe_app/data/api/api_client.dart';
import 'package:new_recipe_app/data/repository/CategoryRepository.dart';
import 'package:new_recipe_app/data/repository/MealsRepository.dart';
import 'package:new_recipe_app/utils/app_constants.dart';

Future<void>init() async{

  //Api Client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //Repos
  Get.lazyPut(() => CategoryRepository(apiClient: Get.find()));
  Get.lazyPut(() => MealsRepository(apiClient: Get.find()));


  //Controllers

  Get.lazyPut(() => CategoryController(categoryRepository: Get.find()));
  Get.lazyPut(() => HomePageController());
  Get.create(() => MealsController(mealsRepository:Get.find()));


}