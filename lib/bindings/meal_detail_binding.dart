import 'package:get/get.dart';
import 'package:new_recipe_app/controllers/meal_detail_controller.dart';
import 'package:new_recipe_app/controllers/meals_controller.dart';
import 'package:new_recipe_app/data/api/api_client.dart';
import 'package:new_recipe_app/data/repository/MealsRepository.dart';
import 'package:new_recipe_app/utils/app_constants.dart';

class MealDetailBinding extends Bindings {
  @override
  void dependencies() {
    //Client
    Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

    //Repository
    Get.lazyPut(() => MealsRepository(apiClient: Get.find()));

    //Controllers
    Get.lazyPut(() => MealDetailController(mealsRepository: Get.find()));
  }
}
