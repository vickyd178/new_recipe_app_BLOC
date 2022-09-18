import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:new_recipe_app/controllers/CategoryController.dart';
import 'package:new_recipe_app/controllers/meals_controller.dart';
import 'package:new_recipe_app/models/CategoryModel.dart';
import 'package:new_recipe_app/utils/app_constants.dart';
import 'package:new_recipe_app/utils/colors.dart';
import 'package:new_recipe_app/widgets/expandable_text_widget.dart';
import 'package:new_recipe_app/widgets/meal_card_widget.dart';
import 'package:new_recipe_app/widgets/progress_bar_widget.dart';

class DishesPage extends GetWidget<MealsController> {

  DishesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if (controller.meals.isEmpty) {
      controller.filterMeals(AppConstants.FILTER_CATEGORY+controller.category.strCategory!);
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
                          "Meals",
                          style: TextStyle(
                              fontSize: 20,
                              color: AppColors.mainBlackColor,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    automaticallyImplyLeading: false,
                    backgroundColor: AppColors.yellowColor,
                    pinned: true,
                    expandedHeight: 250,
                    elevation: 0,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.network(
                        controller.category.strCategoryThumb!,
                        width: double.maxFinite,
                        fit: BoxFit.contain,
                      ),
                    ),
                    bottom: PreferredSize(
                        preferredSize: Size.fromHeight(kToolbarHeight / 1.5),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          padding: EdgeInsets.only(
                              left: 10, top: 10, bottom: 5, right: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            controller.category.strCategory!,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                        )),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.only( left: 10, right: 10,bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ExpandableTextWidgets(
                            text: controller.category.strCategoryDescription!,
                          ),
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
                            itemBuilder: (context, index) => MealCardWidget(meal: controller.meals[index]),
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
