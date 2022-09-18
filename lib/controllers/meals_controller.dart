import 'package:get/get.dart';
import 'package:new_recipe_app/data/repository/MealsRepository.dart';
import 'package:new_recipe_app/models/CategoryModel.dart';
import 'package:new_recipe_app/models/area_model.dart';
import 'package:new_recipe_app/models/meal_detail_model.dart';
import 'package:new_recipe_app/models/meals_model.dart';

class MealsController extends GetxController {
  final MealsRepository mealsRepository;

  MealsController({required this.mealsRepository});

  List<dynamic> _meals = <Meal>[].obs;

  List<dynamic> get meals => _meals;

  List<dynamic> _mealDetail = <MealDetail>[].obs;

  List<dynamic> get mealsDetail => _mealDetail;

  RxBool isLoadingDishes = false.obs;
  RxBool isLoadingDishDetails = false.obs;
  late Categories _categories;

  Categories get category => _categories;
  late Area _area;

  Area get area => _area;
  late Meal _meal;

  Meal get meal => _meal;

  @override
  onInit() {
    super.onInit();
    if (Get.arguments["category"] != null)
      _categories = Get.arguments["category"];
    if (Get.arguments["area"] != null) _area = Get.arguments["area"];
    if (Get.arguments["meal"] != null) _meal = Get.arguments["meal"];
  }

  Future<void> filterMeals(filter) async {
    isLoadingDishes.value = true;
    Response response = await mealsRepository.filterMeals(filter);
    if (response.statusCode == 200) {
      _meals = [];
      _meals.addAll(MealsModel.fromJson(response.body).meals);
      update();
      isLoadingDishes.value = false;
    } else {
      isLoadingDishes.value = false;
      print("Error:${response.statusText}");
      update();
    }
  }

  Future<void> getMealDetails(url) async {
    isLoadingDishDetails.value = true;
    Response response = await mealsRepository.getMealDetail(url);
    if (response.statusCode == 200) {
      _mealDetail = [];
      _mealDetail.addAll(MealDetailModel.fromJson(response.body).meals);
      update();
      isLoadingDishDetails.value = false;
    } else {
      isLoadingDishDetails.value = false;
      print("Error:${response.statusText}");
      update();
    }
  }
}
