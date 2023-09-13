// Dejaré aqui todos los metodos que se usaran en el proyecto

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DataRepository {
  Future<DocumentSnapshot> getPasswords();
  Future<DocumentSnapshot> searchPassword(String name);
  Future<DocumentSnapshot> addPassword(String name, String password);
  Future<DocumentSnapshot> updatePassword(String name, String password);
  Future<DocumentSnapshot> deletePassword(String name);

  Future<DocumentSnapshot> addToFavourites(String name);
  Future<DocumentSnapshot> getFavouritesPasswords();
  Future<DocumentSnapshot> takeLatestPassword();
  Future<DocumentSnapshot> getRecentViewedPasswords();
  Future<DocumentSnapshot> takeLatestUpdatedPassword();

  Future<DocumentSnapshot> tagPassword(String name, String tag);
  Future<DocumentSnapshot> untagPassword(String name, String tag);

  Future<DocumentSnapshot> getTags();
  Future<DocumentSnapshot> addTag(String name);
  Future<DocumentSnapshot> updateTag(String name);
  Future<DocumentSnapshot> deleteTag(String name);

  Future<DocumentSnapshot> getCategories();
  Future<DocumentSnapshot> addCategory(String name);
  Future<DocumentSnapshot> updateCategory(String name);
  Future<DocumentSnapshot> deleteCategory(String name);
}