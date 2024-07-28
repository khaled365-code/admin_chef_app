import 'chefs.dart';

/// chefs : [{"_id":"64d7492c4fca89ed856d9e6a","name":"Anas","phone":"1101459565","email":"tasnemradwan87@gmail.com","status":"pending"},{"_id":"64da69cfb16043104315cd32","name":"Anas","phone":"1101459565","email":"khaledramdan880@yahoo.com","status":"pending"},{"_id":"64e9d099cbd7f16ac570300d","name":"Nourhan","phone":"1101459565","email":"nourhan.hamada996@gmail.com","status":"pending"},{"_id":"64ea6d00a4e198639d667cbf","name":"amr","phone":"01102800373","email":"amrhafiz47@gmail.com","status":"pending"},{"_id":"64fa5905fd0ca241462fbf2a","name":"Tasneem","phone":"1101459565","email":"tasneemahmed507@gmail.com","status":"pending"},{"_id":"64fb51cf83c54e03c745f2e7","name":"Anas","phone":"1101459565","email":"mohamedhisham1369@gmail.com","status":"pending"},{"_id":"64fd4d25cb6d267fddf0241a","name":"Mahmoud","phone":"1101459565","email":"mahmoudmaster146@gmail.com","status":"pending"},{"_id":"64fdfbab4f117e80d5a65190","name":"mohamed","phone":"0112014041","email":"mido29hesham@gmail.com","status":"pending"},{"_id":"64ff86deea53f506208f5183","name":"Mahmoud","phone":"11223322332","email":"mhnasser6003@gmail.com","status":"pending"},{"_id":"65087ec0827f221616cfec0c","name":"Anas","phone":"1101459565","email":"youmna8765@gmail.com","status":"pending"},{"_id":"651fd5fdb267b5fa44aee787","name":"Aly Fadel","phone":"1144555222","email":"alyfadel67@gmail.com","status":"pending"},{"_id":"6521152cc73d2247f6206b15","name":"Aly Fadhel ","phone":"01098913397","email":"aly.elewii@yahoo.com","status":"pending"},{"_id":"652557eacac4cf823364069c","name":"AliOsama","phone":"01557712317","email":"osamaomran1917@gmail.com","status":"pending"},{"_id":"653696a8456be28d20e765a8","name":"Mohammed Saeed","phone":"01126414087","email":"happytech.mohammedsaeed@gmail.com","status":"pending"},{"_id":"65369804456be28d20e765af","name":"Mohammed Saeed","phone":"01126414087","email":"mohammedsaeed892002@gmail.com","status":"pending"},{"_id":"6536995c456be28d20e765b7","name":"Mohammed Saeed","phone":"01126414087","email":"mohammed.saeed1442018@gmail.com","status":"pending"},{"_id":"654935270bc23f4c4b7691b7","name":"khazbak","phone":"1101459563","email":"ibraheemmkhazbak@gmail.com","status":"pending"},{"_id":"65493a1873456e755c4f0e37","name":"youmna","phone":"1101459565","email":"yoyoessam2001@gmail.com","status":"pending"},{"_id":"654a6da357e84922bd5ac7d7","name":"Ali Maalool","phone":"4595658567","email":"oo9264667@gmail.com","status":"pending"},{"_id":"65652ce855f05540b1cee9c3","name":"engy","phone":"0271233372","email":"engymagdy216@gmail.com","status":"pending"},{"_id":"6565ac2ec7e12088424e6ddb","name":"mahmoud","phone":"1101459565","email":"mahmoudrabea082@gmail.com","status":"pending"},{"_id":"6571081c3f5f70995112d9f0","name":"samaa","phone":"0122769005","email":"samaa.hamayel.01@gmail.com","status":"pending"},{"_id":"65882a660d1b43d0e32f5862","name":"engy","phone":"01271233338","email":"engymagdy415@gmail.com","status":"pending"},{"_id":"65898606b40d96ff1a9ecf61","name":"Bokl2002","phone":"01018994378","email":"bokl672002@gmail.com","status":"pending"},{"_id":"65cff1a8f4a4cbd2be37dc33","name":"Kardhcggj","phone":"1256562518","email":"ay1853527@gmail.com","status":"pending"},{"_id":"65d0352d6b6109939f5cf457","name":"taha","phone":"1101459565","email":"helmytaha46@gmail.com","status":"pending"},{"_id":"65de342066063a6d2463c00d","name":"Mohammed","phone":"0102526203","email":"mohammedmelbeik@gmail.com","status":"pending"},{"_id":"66165ff31c3067978ff81ab0","name":"aya123","phone":"1101459565","email":"ayash0537@gmail.com","status":"pending"},{"_id":"663b48af1891b9f0ad5fc35e","name":"ahmad","phone":"0962694065","email":"iteahmad2001@gmail.com","status":"pending"},{"_id":"6647f9aa17a78216b4b9b9b1","name":"sho sho","phone":"01555776322","email":"ayaa.nassser@gmail.com","status":"pending"},{"_id":"664ef0493b7614400fef695f","name":"aya","phone":"0129887653","email":"alanasrabwalswd@gmail.com","status":"pending"},{"_id":"668c895464c0fc093ab80179","name":"mohammed","phone":"0936815741","email":"s.cmohammedbatal@gmail.com","status":"pending"},{"_id":"66a18f60404adf7977b1e9b1","name":"mohamed","phone":"01026489575","email":"lam30310@gmail.com","status":"pending"}]

class AllChefsDataModel {
  AllChefsDataModel({
      this.chefs,});

  AllChefsDataModel.fromJson(dynamic json) {
    if (json['chefs'] != null) {
      chefs = [];
      json['chefs'].forEach((v) {
        chefs?.add(ChefsData.fromJson(v));
      });
    }
  }
  List<ChefsData>? chefs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (chefs != null) {
      map['chefs'] = chefs?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}