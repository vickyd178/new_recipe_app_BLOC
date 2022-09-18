import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_recipe_app/controllers/CategoryController.dart';
import 'package:new_recipe_app/helper/routes.dart';
import 'package:new_recipe_app/widgets/CategoryCardWidget.dart';
import 'package:new_recipe_app/widgets/progress_bar_widget.dart';

class CategoryPageBody extends GetWidget<CategoryController> {
  const CategoryPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.categoryList.isEmpty) {
      controller.getCategories();
    }
    return Obx(
      () => controller.isLoadingCategories.value
          ? ProgressBarWidget(message: "Loading categories...")
          : Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.symmetric(vertical: 5),
                  height: kToolbarHeight,
                  child: controller.isLoadingAreas.value
                      ? CircularProgressIndicator()
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.areaList.length,
                          itemBuilder: ((context, index) => GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.MEALS_BY_AREA, arguments: {
                                    "area": controller.areaList[index],
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 8, bottom: 8, left: 15, right: 15),
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, bottom: 5),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          offset: Offset(-1, 2),
                                          blurRadius: 3,
                                        )
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(500)),
                                  child: Center(
                                      child: Text(
                                          controller.areaList[index].strArea!)),
                                ),
                              )),
                        ),
                ),
                Expanded(
                  flex: 14,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: context.isPortrait ? 1 : 2,
                          childAspectRatio: context.isPortrait
                              ? context.width / (context.height / 6.5)
                              : context.width / (context.height / 1.6)),
                      itemCount: controller.categoryList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.toNamed(Routes.MEALS, arguments: {
                              "category": controller.categoryList[index],
                            });
                          },
                          child: CategoryCardWidget(
                              category: controller.categoryList[index]),
                        );
                      }),
                ),
              ],
            ),
    );
  }
}
