// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Favourites`
  String get favourites {
    return Intl.message(
      'Favourites',
      name: 'favourites',
      desc: '',
      args: [],
    );
  }

  /// `My Favourites`
  String get myFavourites {
    return Intl.message(
      'My Favourites',
      name: 'myFavourites',
      desc: '',
      args: [],
    );
  }

  /// `View Favourites`
  String get viewFavourites {
    return Intl.message(
      'View Favourites',
      name: 'viewFavourites',
      desc: '',
      args: [],
    );
  }

  /// `Add your most important passwords to Favorites for quick access!`
  String get favouritesCard {
    return Intl.message(
      'Add your most important passwords to Favorites for quick access!',
      name: 'favouritesCard',
      desc: '',
      args: [],
    );
  }

  /// `Latest Viewed`
  String get latestViewed {
    return Intl.message(
      'Latest Viewed',
      name: 'latestViewed',
      desc: '',
      args: [],
    );
  }

  /// `Viewed passwords are automatically added to this list for quick access!`
  String get viewedCard {
    return Intl.message(
      'Viewed passwords are automatically added to this list for quick access!',
      name: 'viewedCard',
      desc: '',
      args: [],
    );
  }

  /// `Get All`
  String get getAll {
    return Intl.message(
      'Get All',
      name: 'getAll',
      desc: '',
      args: [],
    );
  }

  /// `Latest Added`
  String get latestAdded {
    return Intl.message(
      'Latest Added',
      name: 'latestAdded',
      desc: '',
      args: [],
    );
  }

  /// `Latest Updated`
  String get latestUpdated {
    return Intl.message(
      'Latest Updated',
      name: 'latestUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Latest added passwords are automatically added to this list for quick access!`
  String get latestAddedCard {
    return Intl.message(
      'Latest added passwords are automatically added to this list for quick access!',
      name: 'latestAddedCard',
      desc: '',
      args: [],
    );
  }

  /// `Latest updated passwords are automatically added to this list for quick access!`
  String get latestUpdatedCard {
    return Intl.message(
      'Latest updated passwords are automatically added to this list for quick access!',
      name: 'latestUpdatedCard',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Deleted`
  String get deleted {
    return Intl.message(
      'Deleted',
      name: 'deleted',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Delete Password`
  String get deletePassword {
    return Intl.message(
      'Delete Password',
      name: 'deletePassword',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this password?`
  String get deletePasswordMessage {
    return Intl.message(
      'Are you sure you want to delete this password?',
      name: 'deletePasswordMessage',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get emailRequired {
    return Intl.message(
      'Email is required',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get passwordRequired {
    return Intl.message(
      'Password is required',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get pleaseEnterEmail {
    return Intl.message(
      'Please enter your email',
      name: 'pleaseEnterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get pleaseEnterPassword {
    return Intl.message(
      'Please enter your password',
      name: 'pleaseEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with {provider}`
  String signInWith(Object provider) {
    return Intl.message(
      'Sign in with $provider',
      name: 'signInWith',
      desc: '',
      args: [provider],
    );
  }

  /// `Empty`
  String get empty {
    return Intl.message(
      'Empty',
      name: 'empty',
      desc: '',
      args: [],
    );
  }

  /// `No data`
  String get noData {
    return Intl.message(
      'No data',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to logout?`
  String get logoutMessage {
    return Intl.message(
      'Are you sure you want to logout?',
      name: 'logoutMessage',
      desc: '',
      args: [],
    );
  }

  /// `No passwords yet`
  String get noPasswordsYet {
    return Intl.message(
      'No passwords yet',
      name: 'noPasswordsYet',
      desc: '',
      args: [],
    );
  }

  /// `Passwords`
  String get passwords {
    return Intl.message(
      'Passwords',
      name: 'passwords',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Search is required`
  String get searchRequired {
    return Intl.message(
      'Search is required',
      name: 'searchRequired',
      desc: '',
      args: [],
    );
  }

  /// `Credential`
  String get credential {
    return Intl.message(
      'Credential',
      name: 'credential',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Categories is required`
  String get categoriesRequired {
    return Intl.message(
      'Categories is required',
      name: 'categoriesRequired',
      desc: '',
      args: [],
    );
  }

  /// `Site Address`
  String get siteAddress {
    return Intl.message(
      'Site Address',
      name: 'siteAddress',
      desc: '',
      args: [],
    );
  }

  /// `Site Address is required`
  String get siteAddressRequired {
    return Intl.message(
      'Site Address is required',
      name: 'siteAddressRequired',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Username is required`
  String get usernameRequired {
    return Intl.message(
      'Username is required',
      name: 'usernameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Tags`
  String get tags {
    return Intl.message(
      'Tags',
      name: 'tags',
      desc: '',
      args: [],
    );
  }

  /// `Saving...`
  String get saving {
    return Intl.message(
      'Saving...',
      name: 'saving',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Creating...`
  String get creating {
    return Intl.message(
      'Creating...',
      name: 'creating',
      desc: '',
      args: [],
    );
  }

  /// `Updating...`
  String get updating {
    return Intl.message(
      'Updating...',
      name: 'updating',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Add Tag`
  String get addTag {
    return Intl.message(
      'Add Tag',
      name: 'addTag',
      desc: '',
      args: [],
    );
  }

  /// `Delete Tag`
  String get deleteTag {
    return Intl.message(
      'Delete Tag',
      name: 'deleteTag',
      desc: '',
      args: [],
    );
  }

  /// `Tag`
  String get tag {
    return Intl.message(
      'Tag',
      name: 'tag',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this tag?`
  String get deleteTagMessage {
    return Intl.message(
      'Are you sure you want to delete this tag?',
      name: 'deleteTagMessage',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
