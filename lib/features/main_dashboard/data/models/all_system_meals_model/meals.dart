import 'system_meals_chef_data.dart';

/// _id : "64ff93b5b2e3cbb021ca9713"
/// name : "Chips 3"
/// description : "CHIIIIIIIIIIIIIIIIIIIIIIIIIIPS"
/// chefId : {"_id":"64f7481e5457a5969251e853","name":"Ibrahim Fathi","phone":"01156789207","email":"himafathy796@gmail.com"}
/// status : "pending"

class SystemMeals {
  SystemMeals({
      this.id, 
      this.name, 
      this.description, 
      this.chefId, 
      this.status,});

  SystemMeals.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    description = json['description'];
    chefId = json['chefId'] != null ? SystemMealsChefId.fromJson(json['chefId']) : null;
    status = json['status'];
  }
  String? id;
  String? name;
  String? description;
  SystemMealsChefId? chefId;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['description'] = description;
    if (chefId != null) {
      map['chefId'] = chefId?.toJson();
    }
    map['status'] = status;
    return map;
  }

}