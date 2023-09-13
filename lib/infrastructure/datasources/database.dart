import 'package:cloud_firestore/cloud_firestore.dart';

class Database{
  final FirebaseFirestore database;
  Database(this.database);


  Future<DocumentSnapshot> readCollection(String name)async{
      return await database.collection(name).doc().get();
  }


}