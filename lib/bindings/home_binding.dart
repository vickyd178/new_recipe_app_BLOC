import 'package:get/get.dart';
import 'package:new_recipe_app/controllers/CategoryController.dart';
import 'package:new_recipe_app/controllers/HomePageController.dart';
import 'package:new_recipe_app/data/api/api_client.dart';
import 'package:new_recipe_app/data/repository/CategoryRepository.dart';
import 'package:new_recipe_app/utils/app_constants.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    //Client
    Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

    //Repository
    Get.lazyPut(() => CategoryRepository(apiClient: Get.find()));

    //Controllers
    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => CategoryController(categoryRepository: Get.find()));
  }
}
