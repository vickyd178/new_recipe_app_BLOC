import 'package:get/get.dart';
import 'package:new_recipe_app/data/api/api_client.dart';
import 'package:new_recipe_app/utils/app_constants.dart';

class CategoryRepository extends GetxService {
  final ApiClient apiClient;

  CategoryRepository({required this.apiClient});

  Future<Response> getCategories() async {
    return apiClient.getData(AppConstants.CATEGORIES_URL);
  }
  Future<Response> getCategoriesByArea(area) async {
    return apiClient.getData(AppConstants.CATEGORIES_BY_AREA_URL+area);
  }
  Future<Response> getAreas() async {
    return apiClient.getData(AppConstants.AREA_URL);
  }

  Future<Response> filterDishesByCategory(category) async {
    return apiClient.getData(AppConstants.FILTER_URL+"?c=$category");
  }


}
