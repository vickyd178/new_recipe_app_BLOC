import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:new_recipe_app/controllers/meal_detail_controller.dart';
import 'package:new_recipe_app/models/meals_model.dart';
import 'package:new_recipe_app/utils/app_constants.dart';
import 'package:new_recipe_app/utils/colors.dart';
import 'package:new_recipe_app/widgets/expandable_text_widget.dart';
import 'package:new_recipe_app/widgets/ingredient_widget.dart';
import 'package:new_recipe_app/widgets/progress_bar_widget.dart';

class MealDetailPage extends GetWidget<MealDetailController> {
  late Meal meal;

  MealDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    meal = controller.meal;

    if (controller.mealsDetail.isEmpty) {
      controller.getMealDetails(AppConstants.MEAL_DETAIL_URL + meal.idMeal!);
    }
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => controller.isLoadingDishDetails.value
              ? ProgressBarWidget(message: "Loading ${meal.strMeal} Details...")
              : CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      toolbarHeight: kToolbarHeight,
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarColor: AppColors.mainBlackColor),
                      title: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        highlightColor: AppColors.yellowColor,
                        splashColor: Colors.black,
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: AppColors.mainBlackColor.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(100)),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                      automaticallyImplyLeading: false,
                      backgroundColor: AppColors.yellowColor,
                      pinned: true,
                      expandedHeight: 250,
                      elevation: 0,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Image.network(
                          meal.strMealThumb!,
                          width: double.maxFinite,
                          fit: BoxFit.cover,
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
                            padding: const EdgeInsets.only(
                                left: 10, top: 10, bottom: 5, right: 10),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              meal.strMeal!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 22),
                            ),
                          )),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Instructions:",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            child: ExpandableTextWidgets(
                              text: controller.mealsDetail[0].strInstructions,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Ingredients:",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          for (int i = 1; i <= 20; i++)
                            Container(
                              color: i % 2 == 0
                                  ? Colors.white.withOpacity(0.1)
                                  : Colors.grey.withOpacity(0.1),
                              child: IngredientWidget(
                                ingredient:
                                    "${controller.mealsDetail[0].toJson()["strIngredient$i"]}",
                                measurement:
                                    "${controller.mealsDetail[0].toJson()["strMeasure$i"]}",
                                position: i,
                              ),
                            ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Other Resources:",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: [
                              controller.mealsDetail[0].strYoutube!=""?
                              IconButton(
                                onPressed: () {
                                  controller.launchURL(controller.mealsDetail[0].strYoutube);
                                },
                                icon: Icon(FontAwesomeIcons.youtube),
                                color: Colors.red,
                              ):Container(),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
