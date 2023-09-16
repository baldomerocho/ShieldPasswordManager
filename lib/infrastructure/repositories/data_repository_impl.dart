import 'package:ptf/application/models/password_model.dart';
import 'package:ptf/domain/entities/entities.dart';
import 'package:ptf/domain/repositories/data_repository.dart';
import 'package:ptf/infrastructure/datasources/firebase_firestore.dart';

class DataRepositoryImpl implements DataRepository{
  final Firestore database;
  DataRepositoryImpl({required this.database});

  @override
  Future<PasswordEntity> createPassword(PasswordModel password) => database.createPassword(password: password);

  @override
  Future<void> addToFavourites({required String passId, required bool value}) => database.setFavouritePassword(id: passId, favorite: value);

  @override
  Stream<List<CategoryEntity>> watchCategories() => database.watchCategories();

  @override
  Stream<List<PasswordEntity>> watchFavouritesPasswords() => database.watchPasswordsFavourites();

  @override
  Stream<List<PasswordEntity>> watchPasswords({required String query}) => database.watchPasswords(query: query);

  @override
  Stream<List<PasswordEntity>> watchRecentViewedPasswords() => database.watchRecentViewedPasswords();

  @override
  Stream<List<PasswordEntity>> watchLastCreatedPasswords() => database.watchLastCreatedPasswords();

  @override
  Stream<List<PasswordEntity>> watchLatestUpdatedPasswords() => database.watchLatestUpdatedPasswords();

  @override
  Future<void> deletePassword(String id) => database.deletePassword(id: id);

  @override
  Future<PasswordEntity> updatePassword({required PasswordModel password, required String id})  => database.updatePassword(password:password, id:id);

  @override
  Stream<List<CategoryEntity>> watchCategoriesSlider() => database.watchCategoriesSlider();

  @override
  Future<void> setViewedPassword(String id) => database.setViewedPassword(id: id);

  @override
  Future<void> setPassVulnerable({required String id, required bool value}) => database.setPassVulnerable(id: id, value: value);

  @override
  Future<int> countPassVulnerable() => database.countPassVulnerable();

  @override
  Stream<List<PasswordEntity>> watchPasswordsVulnerable() => database.watchPasswordsVulnerable();
}