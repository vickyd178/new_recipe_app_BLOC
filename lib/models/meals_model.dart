class MealsModel {
  late List<Meal> _meals;

  List<Meal> get meals => _meals;

  MealsModel({meals}) {
    this._meals = meals;
  }

  MealsModel.fromJson(Map<String, dynamic> json) {
    if (json['meals'] != null) {
      _meals = <Meal>[];
      json['meals'].forEach((v) {
        _meals.add(Meal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this._meals != null) {
      data['meals'] = this._meals.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meal {
  String? strMeal;
  String? strMealThumb;
  String? idMeal;

  Meal({this.strMeal, this.strMealThumb, this.idMeal});

  Meal.fromJson(Map<String, dynamic> json) {
    strMeal = json['strMeal'];
    strMealThumb = json['strMealThumb'];
    idMeal = json['idMeal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['strMeal'] = this.strMeal;
    data['strMealThumb'] = this.strMealThumb;
    data['idMeal'] = this.idMeal;
    return data;
  }
}
