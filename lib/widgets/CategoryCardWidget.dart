import 'package:flutter/material.dart';
import 'package:new_recipe_app/models/CategoryModel.dart';
import 'package:new_recipe_app/utils/colors.dart';

class CategoryCardWidget extends StatelessWidget {
  final Categories category;

  const CategoryCardWidget({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(2, 8),
              blurRadius: 8,
            ),
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(0, -2),
              blurRadius: 8,
            )
          ]),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.yellowColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      category.strCategory!,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),

                    Text(
                      category.strCategoryDescription!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style:  TextStyle(
                          fontSize: 12, color: AppColors.titleColor),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                      image: NetworkImage(category.strCategoryThumb!),
                      fit: BoxFit.cover),
                ),
                /*child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(category.strCategoryThumb!)),*/
              ),
            )
          ],
        ),
      ),
    );
  }
}
