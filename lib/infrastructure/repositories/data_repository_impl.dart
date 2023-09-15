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
  Future<void> addToFavourites({required String passId, required bool value}) => database.setFavouritePassword(id: passId, favorite: value);


  @override
  Future<DocumentSnapshot<Object?>> deleteTag(String name) {
    // TODO: implement deleteTag
    throw UnimplementedError();
  }

  @override
  Stream<List<CategoryEntity>> watchCategories() => database.watchCategories();

  @override
  Stream<List<PasswordEntity>> watchFavouritesPasswords() => database.watchPasswordsFavourites();

  @override
  Stream<List<PasswordEntity>> watchPasswords({required String query}) => database.watchPasswords(query: query);

  @override
  Stream<List<PasswordEntity>> watchRecentViewedPasswords() => database.watchRecentViewedPasswords();

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
  Stream<List<PasswordEntity>> watchLastCreatedPasswords() => database.watchLastCreatedPasswords();

  @override
  Stream<List<PasswordEntity>> watchLatestUpdatedPasswords() => database.watchLatestUpdatedPasswords();

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

  @override
  Stream<List<CategoryEntity>> watchCategoriesSlider() => database.watchCategoriesSlider();

  @override
  Future<void> setViewedPassword(String id) => database.setViewedPassword(id: id);
}