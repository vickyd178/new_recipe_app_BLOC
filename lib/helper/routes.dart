import 'package:get/get.dart';
import 'package:new_recipe_app/bindings/home_binding.dart';
import 'package:new_recipe_app/bindings/meal_detail_binding.dart';
import 'package:new_recipe_app/bindings/meals_binding.dart';
import 'package:new_recipe_app/controllers/meal_detail_controller.dart';
import 'package:new_recipe_app/pages/dishes_by_area_page.dart';
import 'package:new_recipe_app/pages/dishes_page.dart';
import 'package:new_recipe_app/pages/homepage.dart';
import 'package:new_recipe_app/pages/meal_detail.dart';

class Routes {
  static const String INITIAL = "/";
  static const String MEALS = "/meals";
  static const String MEALS_BY_AREA = "/meals_by_area";
  static const String MEAL_DETAIL = "/meal_details";

  static final routes = [
    GetPage(name: INITIAL, page: HomePage().obs,binding: HomeBinding()),
    GetPage(name: MEALS, page: DishesPage().obs,binding: MealsBinding(),transition: Transition.cupertino),
    GetPage(name: MEALS_BY_AREA, page: DishesByAreaPage().obs,binding: MealsBinding(),transition: Transition.fadeIn),
    GetPage(name: MEAL_DETAIL, page: MealDetailPage().obs,binding: MealDetailBinding(),transition: Transition.fadeIn),
  ];
}
