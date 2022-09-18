import 'package:get/get.dart';
import 'package:new_recipe_app/data/repository/CategoryRepository.dart';
import 'package:new_recipe_app/models/CategoryModel.dart';
import 'package:new_recipe_app/models/area_model.dart';

class CategoryController extends GetxController {
  final CategoryRepository categoryRepository;

  CategoryController({required this.categoryRepository});

  List<dynamic> _categoryList = <Categories>[].obs;

  List<dynamic> get categoryList => _categoryList;

  List<dynamic> _areaList = <Categories>[].obs;

  List<dynamic> get areaList => _areaList;

  final RxInt _selectedAreaIndex = 0.obs;

  RxInt get selectedAreaIndex => _selectedAreaIndex;

  void selectIndex(int index) {
    print(index);
    _selectedAreaIndex.value = index;
    update();
  }

  RxBool isLoadingCategories = false.obs;
  RxBool isLoadingAreas = false.obs;

  Future<void> getCategories({String? area}) async {
    isLoadingCategories.value = true;
    Response response;
    if (area == null)
      response = await categoryRepository.getCategories();
    else
      response = await categoryRepository.getCategoriesByArea(area);

    if (response.statusCode == 200) {
      _categoryList = [];
      _categoryList.addAll(Category.fromJson(response.body).categories);
      update();
      isLoadingCategories.value = false;
    } else {
      isLoadingCategories.value = false;
      print("Error:${response.statusText}");
    }
    getAreaList();
  }

  Future<void> getAreaList() async {
    isLoadingAreas.value = true;
    Response response = await categoryRepository.getAreas();
    if (response.statusCode == 200) {
      _areaList = [];
      _areaList.addAll(AreaModel.fromJson(response.body).areas);
      update();
      isLoadingAreas.value = false;
    } else {
      isLoadingAreas.value = false;
    }
  }
}
