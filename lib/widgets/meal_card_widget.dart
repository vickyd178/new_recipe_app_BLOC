import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_recipe_app/helper/routes.dart';
import 'package:new_recipe_app/models/meals_model.dart';

class MealCardWidget extends StatelessWidget {
  final Meal meal;

  const MealCardWidget({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        Get.toNamed(Routes.MEAL_DETAIL,arguments: {
          "meal": meal,
        });
      },
      child: Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Text(
                meal.strMeal!,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(meal.strMealThumb!),
            ),
            color: Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
