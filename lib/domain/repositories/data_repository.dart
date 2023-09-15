// Dejaré aqui todos los metodos que se usaran en el proyecto

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ptf/application/models/password_model.dart';
import 'package:ptf/domain/entities/entities.dart';

abstract class DataRepository {
  Stream<List<PasswordEntity>> watchPasswords({required String query});
  Stream<List<PasswordEntity>> searchPassword(String name);
  Future<PasswordEntity> createPassword(PasswordModel password);
  Future<PasswordEntity> updatePassword({required PasswordModel password, required String id});
  Future<void> deletePassword(String id);

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

  Stream<List<CategoryEntity>> watchCategories();
  Future<DocumentSnapshot> addCategory(String name);
  Future<DocumentSnapshot> updateCategory(String name);
  Future<DocumentSnapshot> deleteCategory(String name);
}