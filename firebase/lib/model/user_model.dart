// fireStorede tutualcak olan verinin yansıması
class UserModel{
final String? uid;
final String? name;
final String? surname;
final String? mailAddress;

UserModel({
  required this.uid,
  required this.name,
  required this.surname,
  required this.mailAddress,
});

factory UserModel.fromJson(Map<String,dynamic>json) {
  return UserModel(
    uid: json['uid'],
    name: json['name'],
    surname: json['surname'],
    mailAddress: json['emailAddress'],
  );
}

 Map<String,dynamic> toJson(){
  Map<String,dynamic> data=Map();

      data["uid"]=this.uid;
      data["name"]=this.name;
      data["surname"]=this.surname;
      data["emailAddress"]=this.mailAddress;
    return data;
    }

}