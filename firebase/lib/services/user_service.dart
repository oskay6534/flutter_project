import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // createuser
  Future<void> createDbUser (UserModel user)async{
    try{
      await firestore.collection("users").doc(user.uid).set(user.toJson());
    }
    
     
     catch(e){
      print("kullanıcı olusturma hatasi $e");
     }
  }

}
