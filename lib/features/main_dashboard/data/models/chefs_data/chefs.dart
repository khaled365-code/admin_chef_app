/// _id : "64d7492c4fca89ed856d9e6a"
/// name : "Anas"
/// phone : "1101459565"
/// email : "tasnemradwan87@gmail.com"
/// status : "pending"

class ChefsData {
  ChefsData({
      this.id, 
      this.name, 
      this.phone, 
      this.email, 
      this.status,});

  ChefsData.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    status = json['status'];
  }
  String? id;
  String? name;
  String? phone;
  String? email;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['email'] = email;
    map['status'] = status;
    return map;
  }

}