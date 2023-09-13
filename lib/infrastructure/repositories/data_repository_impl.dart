import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ptf/domain/repositories/data_repository.dart';

class DataRepositoryImpl implements DataRepository{
  @override
  Future<DocumentSnapshot<Object?>> addCategory(String name) {
    // TODO: implement addCategory
    throw UnimplementedError();
  }

  @override
  Future<DocumentSnapshot<Object?>> addPassword(String name, String password) {
    // TODO: implement addPassword
    throw UnimplementedError();
  }

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
  Future<DocumentSnapshot<Object?>> deleteCategory(String name) {
    // TODO: implement deleteCategory
    throw UnimplementedError();
  }

  @override
  Future<DocumentSnapshot<Object?>> deletePassword(String name) {
    // TODO: implement deletePassword
    throw UnimplementedError();
  }

  @override
  Future<DocumentSnapshot<Object?>> deleteTag(String name) {
    // TODO: implement deleteTag
    throw UnimplementedError();
  }

  @override
  Future<DocumentSnapshot<Object?>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<DocumentSnapshot<Object?>> getFavouritesPasswords() {
    // TODO: implement getFavouritesPasswords
    throw UnimplementedError();
  }

  @override
  Future<DocumentSnapshot<Object?>> getPasswords() {
    // TODO: implement getPasswords
    throw UnimplementedError();
  }

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
  Future<DocumentSnapshot<Object?>> searchPassword(String name) {
    // TODO: implement searchPassword
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
  Future<DocumentSnapshot<Object?>> updatePassword(String name, String password) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }

  @override
  Future<DocumentSnapshot<Object?>> updateTag(String name) {
    // TODO: implement updateTag
    throw UnimplementedError();
  }
}