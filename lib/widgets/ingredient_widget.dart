import 'package:flutter/material.dart';

class IngredientWidget extends StatelessWidget {
  final String ingredient;
  final String measurement;
  final int position;

  const IngredientWidget(
      {Key? key,
      required this.ingredient,
      required this.measurement,
      required this.position})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ingredient.isNotEmpty
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "$position: $ingredient",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.left,
                  ),
                ),
                Expanded(
                  child: Text(
                    ": $measurement",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          )
        : Container();
  }
}
