import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ptf/application/models/password_model.dart';
import 'package:ptf/domain/entities/entities.dart';

class Firestore{
  final FirebaseFirestore database;
  Firestore(this.database);


  Future<DocumentSnapshot> getAllPasswords()async{
      return await database.collection("passwords").doc().get();
  }

  Stream<List<CategoryEntity>> watchCategories(){
    return database.collection("categories").snapshots().map((QuerySnapshot<Map<String, dynamic>> snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return CategoryEntity.fromJson(data);
      }).toList();
    });
  }

  Stream<List<CategoryEntity>> watchCategoriesSlider(){
    return database.collection("categories").snapshots().map((QuerySnapshot<Map<String, dynamic>> snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return CategoryEntity.fromJson(data);
      }).toList();
    });
  }

  Future<DocumentReference> getTagsPassword(String id)async{
      return await database.collection("passwords").doc(id).collection("tags").add({"name":"tag"});
  }

  Future<void> newTagPassword(String idPassword, String name)async{
      final tag = await database.collection("passwords").add({"name":name});
      await database.collection("passwords").doc(idPassword).collection("tags").doc(tag.id).set({"name":name});
  }

  Future<PasswordEntity> createPassword({required PasswordModel password})async{
    final response = await database.collection("passwords").add(password.toJson());
    final pass = await database.collection("passwords").doc(response.id).get();
    final json = pass.data() as Map<String, dynamic>;
    json['id'] = pass.id;
    return PasswordEntity.fromJson(json);
  }

  Future<PasswordEntity> updatePassword({required PasswordModel password, required String id})async{
    await database.collection("passwords").doc(id).update(password.toJson());
    final pass = await database.collection("passwords").doc(id).get();
    final json = pass.data() as Map<String, dynamic>;
    json['id'] = pass.id;
    return PasswordEntity.fromJson(json);
  }

  Future<void> deletePassword({required String id})async{
    await database.collection("passwords").doc(id).delete();
  }

  Stream<List<PasswordEntity>> watchPasswordsFavourites() {
    return database
        .collection('passwords')
        .where('favorite', isEqualTo: true)
        .snapshots()
        .map((QuerySnapshot<Map<String, dynamic>> snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return PasswordEntity.fromJson(data);
      }).toList();
    });
  }

  Future<void> setFavouritePassword({required String id, required bool favorite}) async {
    await database.collection("passwords").doc(id).update({"favorite":favorite});
  }

  Future<void> setViewedPassword({required String id}) async {
    await database.collection("passwords").doc(id).update({"latest_viewed": FieldValue.serverTimestamp()});
  }

  Stream<List<PasswordEntity>> watchRecentViewedPasswords() {
    return database
        .collection('passwords')
        .orderBy("latest_viewed", descending: true)
        .limit(3)
        .snapshots()
        .map((QuerySnapshot<Map<String, dynamic>> snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return PasswordEntity.fromJson(data);
      }).toList();
    });
  }

  Stream<List<PasswordEntity>> watchLatestUpdatedPasswords() {
    return database
        .collection('passwords')
        .orderBy("updated_at", descending: true)
        .limit(5)
        .snapshots()
        .map((QuerySnapshot<Map<String, dynamic>> snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return PasswordEntity.fromJson(data);
      }).toList();
    });
  }

  Stream<List<PasswordEntity>> watchLastCreatedPasswords() {
    return database
        .collection('passwords')
        .orderBy("created_at", descending: true)
        .limit(5)
        .snapshots()
        .map((QuerySnapshot<Map<String, dynamic>> snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return PasswordEntity.fromJson(data);
      }).toList();
    });
  }

  Stream<List<PasswordEntity>> watchPasswords({required String query}) {
    if(query.isEmpty) {
      return database
          .collection('passwords')
          .orderBy("created_at", descending: true)
          .snapshots()
          .map((QuerySnapshot<Map<String, dynamic>> snapshot) {
        return snapshot.docs.map((doc) {
          final data = doc.data();
          data['id'] = doc.id;
          return PasswordEntity.fromJson(data);
        }).toList();
      });
    }
    return database
        .collection('passwords')
        // .where('username', isGreaterThanOrEqualTo: queryText)
        // .where('username', isLessThan: queryText + 'z')
        .where(
          Filter.or(
              Filter("username", isEqualTo: query),
              Filter("website", isEqualTo: query),
              Filter("category_id", isEqualTo: query),
          )
        )
        .snapshots()
        .map((QuerySnapshot<Map<String, dynamic>> snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return PasswordEntity.fromJson(data);
      }).toList();
    });
  }

  Stream<List<PasswordEntity>> watchPasswordsVulnerable() {
    return database
        .collection('passwords')
        .where('safe', isEqualTo: false)
        .snapshots()
        .map((QuerySnapshot<Map<String, dynamic>> snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return PasswordEntity.fromJson(data);
      }).toList();
    });
  }

  Future<void> setPassVulnerable({required String id, required bool value}) async {
    await database.collection("passwords").doc(id).update({"safe":value});
  }

  Future<int> countPassVulnerable() async {
    final response = await database.collection("passwords").where("safe", isEqualTo: false).get();
    return response.docs.length;
  }

}