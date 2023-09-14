import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ptf/application/models/password_model.dart';

class Firestore{
  final FirebaseFirestore database;
  Firestore(this.database);


  Future<DocumentSnapshot> getAllPasswords()async{
      return await database.collection("passwords").doc().get();
  }

  Future<DocumentReference> createPassword({required PasswordModel password})async{
    print("saving password... $password"); // TODO: remove this line
    return await database.collection("passwords").add(password.toJson());
  }


}