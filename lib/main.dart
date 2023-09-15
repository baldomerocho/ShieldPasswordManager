import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ptf/domain/repositories/authentication_repository.dart';
import 'package:ptf/domain/repositories/data_repository.dart';
import 'package:ptf/infrastructure/datasources/firebase_authentication.dart';
import 'package:ptf/infrastructure/datasources/firebase_firestore.dart';
import 'package:ptf/infrastructure/repositories/authentication_repository_impl.dart';
import 'package:ptf/infrastructure/repositories/data_repository_impl.dart';
import 'package:ptf/presentation/blocs/data/set_pass_favourite/set_pass_favourite_bloc.dart';
import 'package:ptf/routes.dart';

import 'firebase_options.dart';
import 'local.dart';
import 'presentation/blocs/blocs.dart';
import 'presentation/screens/in.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final Firestore database = Firestore(firestore);
  final FirebaseAuthentication firebaseAuthentication = FirebaseAuthentication();
  final DataRepository dataRepository = DataRepositoryImpl(database: database);
  // repositories
  final AuthenticationRepository authenticationRepository = AuthenticationRepositoryImpl(firebaseAuthentication);
  runApp(MyApp(authenticationRepository: authenticationRepository, dataRepository: dataRepository));
}

class MyApp extends StatelessWidget {
  final AuthenticationRepository authenticationRepository;
  final DataRepository dataRepository;
  const MyApp({super.key, required this.authenticationRepository, required this.dataRepository});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SessionBloc(repository: authenticationRepository)),
        BlocProvider(create: (_) => AuthenticationBloc(repository: authenticationRepository)),

        BlocProvider(create: (_) => SavePassBloc(repository: dataRepository)),
        BlocProvider(create: (_) => UpdatePassBloc(repository: dataRepository)),
        BlocProvider(create: (_) => DeletePassBloc(repository: dataRepository)),
        BlocProvider(create: (_) => SetPassFavouriteBloc(repository: dataRepository)),
        BlocProvider(create: (_) => SetViewedBloc(repository: dataRepository)),
        BlocProvider(create: (_) => TakeLastViewsBloc(repository: dataRepository)),
        BlocProvider(create: (_) => TakeLastCreatedBloc(repository: dataRepository)),
        BlocProvider(create: (_) => TakeLatestUpdatedBloc(repository: dataRepository)),
        BlocProvider(create: (_) => WatchPasswordsBloc(repository: dataRepository)),
        BlocProvider(create: (_) => WatchCategoriesBloc(repository: dataRepository)),
        BlocProvider(create: (_) => WatchCategoriesSliderBloc(repository: dataRepository)),
        BlocProvider(create: (_) => WatchPassFavouritesBloc(repository: dataRepository)),
      ],
      child: MaterialApp(
        title: 'SHIELD PASS',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
          useMaterial3: true,
          fontFamily: "DM Sans",
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue,
            )
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            elevation: 0,
            backgroundColor: Colors.pink.shade200,
            foregroundColor: Colors.white,
          ),
        ),
        home: const InSession(),
        initialRoute: "/",
        routes: RoutesApp.way,
        localizationsDelegates: [
          AppLocalizations.delegate, // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('es'), // Spanish
        ],
      ),
    );
  }
}
