import 'package:get/get.dart';
import 'package:new_recipe_app/data/api/api_client.dart';
import 'package:new_recipe_app/utils/app_constants.dart';

class MealsRepository extends GetxService {
  final ApiClient apiClient;

  MealsRepository({required this.apiClient});

  Future<Response> filterDishesByCategory(category) async {
    return apiClient.getData(AppConstants.FILTER_URL+"?c=$category");
  }

  Future<Response> filterMeals(filter) async {
    return apiClient.getData(filter);
  }


  Future<Response> getMealDetail(url) async {
    return apiClient.getData(url);
  }



}
