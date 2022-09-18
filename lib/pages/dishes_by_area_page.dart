import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:new_recipe_app/controllers/meals_controller.dart';
import 'package:new_recipe_app/models/area_model.dart';
import 'package:new_recipe_app/utils/app_constants.dart';
import 'package:new_recipe_app/utils/colors.dart';
import 'package:new_recipe_app/widgets/meal_card_widget.dart';
import 'package:new_recipe_app/widgets/progress_bar_widget.dart';

class DishesByAreaPage extends GetWidget<MealsController> {
  late Area area;

  DishesByAreaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    area = controller.area;
    if (controller.meals.isEmpty) {
      controller.filterMeals(AppConstants.FILTER_AREA + area.strArea!);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => controller.isLoadingDishes.value
            ? const ProgressBarWidget(
                message: 'Loading Meals...',
              )
            : CustomScrollView(
                slivers: [
                  SliverAppBar(
                    toolbarHeight: kToolbarHeight,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: AppColors.mainBlackColor),
                    title: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          area.strArea! + " Recipes",
                          style: TextStyle(
                              fontSize: 18,
                              color: AppColors.mainBlackColor,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    automaticallyImplyLeading: false,
                    backgroundColor: AppColors.yellowColor,
                    pinned: true,
                    elevation: 0,
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.meals.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: context.isPortrait ? 2 : 5,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemBuilder: (context, index) =>
                                MealCardWidget(meal: controller.meals[index]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
