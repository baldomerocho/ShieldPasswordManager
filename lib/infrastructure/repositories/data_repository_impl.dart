import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ptf/application/models/password_model.dart';
import 'package:ptf/domain/entities/entities.dart';
import 'package:ptf/domain/repositories/data_repository.dart';
import 'package:ptf/infrastructure/datasources/firebase_firestore.dart';

class DataRepositoryImpl implements DataRepository{
  final Firestore database;
  DataRepositoryImpl({required this.database});
  @override
  Future<DocumentSnapshot<Object?>> addCategory(String name) {
    // TODO: implement addCategory
    throw UnimplementedError();
  }

  @override
  Future<PasswordEntity> createPassword(PasswordModel password) => database.createPassword(password: password);

  @override
  Future<DocumentSnapshot<Object?>> addTag(String name) {
    // TODO: implement addTag
    throw UnimplementedError();
  }

  @override
  Future<DocumentSnapshot<Object?>> addToFavourites(String name) {
    // TODO: implement addToFavourites
    throw UnimplementedError();
  }


  @override
  Future<DocumentSnapshot<Object?>> deleteTag(String name) {
    // TODO: implement deleteTag
    throw UnimplementedError();
  }

  @override
  Stream<List<CategoryEntity>> watchCategories() => database.watchCategories();

  @override
  Future<DocumentSnapshot<Object?>> getFavouritesPasswords() {
    // TODO: implement getFavouritesPasswords
    throw UnimplementedError();
  }

  @override
  Stream<List<PasswordEntity>> watchPasswords({required String query}) => database.watchPasswords(query: query);

  @override
  Future<DocumentSnapshot<Object?>> getRecentViewedPasswords() {
    // TODO: implement getRecentViewedPasswords
    throw UnimplementedError();
  }

  @override
  Future<DocumentSnapshot<Object?>> getTags() {
    // TODO: implement getTags
    throw UnimplementedError();
  }


  @override
  Future<DocumentSnapshot<Object?>> tagPassword(String name, String tag) {
    // TODO: implement tagPassword
    throw UnimplementedError();
  }

  @override
  Future<DocumentSnapshot<Object?>> takeLatestPassword() {
    // TODO: implement takeLatestPassword
    throw UnimplementedError();
  }

  @override
  Future<DocumentSnapshot<Object?>> takeLatestUpdatedPassword() {
    // TODO: implement takeLatestUpdatedPassword
    throw UnimplementedError();
  }

  @override
  Future<DocumentSnapshot<Object?>> untagPassword(String name, String tag) {
    // TODO: implement untagPassword
    throw UnimplementedError();
  }

  @override
  Future<DocumentSnapshot<Object?>> updateCategory(String name) {
    // TODO: implement updateCategory
    throw UnimplementedError();
  }


  @override
  Future<DocumentSnapshot<Object?>> updateTag(String name) {
    // TODO: implement updateTag
    throw UnimplementedError();
  }

  @override
  Future<DocumentSnapshot<Object?>> deleteCategory(String name) {
    // TODO: implement deleteCategory
    throw UnimplementedError();
  }

  @override
  Future<void> deletePassword(String id) => database.deletePassword(id: id);

  @override
  Stream<List<PasswordEntity>> searchPassword(String name) {
    // TODO: implement searchPassword
    throw UnimplementedError();
  }

  @override
  Future<PasswordEntity> updatePassword({required PasswordModel password, required String id})  => database.updatePassword(password:password, id:id);
}