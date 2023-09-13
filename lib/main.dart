import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptf/domain/repositories/authentication_repository.dart';
import 'package:ptf/infrastructure/datasources/firebase_authentication.dart';
import 'package:ptf/infrastructure/repositories/authentication_repository_impl.dart';

import 'firebase_options.dart';
import 'presentation/blocs/blocs.dart';
import 'presentation/screens/in.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final FirebaseAuthentication firebaseAuthentication = FirebaseAuthentication();
  // repositories
  final AuthenticationRepository authenticationRepository = AuthenticationRepositoryImpl(firebaseAuthentication);
  runApp(MyApp(authenticationRepository: authenticationRepository));
}

class MyApp extends StatelessWidget {
  final AuthenticationRepository authenticationRepository;
  const MyApp({super.key, required this.authenticationRepository});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SessionBloc(repository: authenticationRepository)),
        BlocProvider(create: (_) => AuthenticationBloc(repository: authenticationRepository)),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
          useMaterial3: true,
          fontFamily: "DM Sans",
        ),
        home: const InSession()
      ),
    );
  }
}
