import 'package:get/get.dart';
import 'package:new_recipe_app/data/repository/MealsRepository.dart';
import 'package:new_recipe_app/models/meal_detail_model.dart';
import 'package:new_recipe_app/models/meals_model.dart';
import 'package:url_launcher/url_launcher.dart';

class MealDetailController extends GetxController {
  final MealsRepository mealsRepository;

  MealDetailController({required this.mealsRepository});


  List<dynamic> _mealDetail = <MealDetail>[].obs;

  List<dynamic> get mealsDetail => _mealDetail;

  RxBool isLoadingDishDetails = false.obs;

  late Meal _meal;

  Meal get meal => _meal;

  @override
  onInit() {
    super.onInit();
    if (Get.arguments["meal"] != null) _meal = Get.arguments["meal"];
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


  void launchURL(url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
}
