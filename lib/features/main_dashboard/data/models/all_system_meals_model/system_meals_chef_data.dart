/// _id : "64f7481e5457a5969251e853"
/// name : "Ibrahim Fathi"
/// phone : "01156789207"
/// email : "himafathy796@gmail.com"

class SystemMealsChefId {
  SystemMealsChefId({
      this.id, 
      this.name, 
      this.phone, 
      this.email,});

  SystemMealsChefId.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
  }
  String? id;
  String? name;
  String? phone;
  String? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['email'] = email;
    return map;
  }

}