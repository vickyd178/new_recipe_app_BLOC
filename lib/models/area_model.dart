class AreaModel {
  late List<Area> _areas;

  List<Area> get areas => _areas;

  AreaModel(areas) {
    this._areas = areas;
  }

  AreaModel.fromJson(Map<String, dynamic> json)
      : _areas = (json['meals'] as List)
            .map((dynamic e) => Area.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'meals': _areas.map((e) => e.toJson()).toList()};
}

class Area {
  final String? strArea;

  Area({
    this.strArea,
  });

  Area.fromJson(Map<String, dynamic> json)
      : strArea = json['strArea'] as String?;

  Map<String, dynamic> toJson() => {'strArea': strArea};
}
