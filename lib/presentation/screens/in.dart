import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptf/presentation/blocs/blocs.dart';
import 'package:ptf/presentation/screens/authentication/login_page.dart';
import 'package:ptf/presentation/screens/home/home_page.dart';
import 'package:ptf/presentation/widgets/loader_page.dart';

class InSession extends StatelessWidget {
  const InSession({super.key});
  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionBloc, SessionState>(
      builder: (context, state) {
        return state.when(
            initial: () {
              context.read<SessionBloc>().add(const SessionEvent.loggedIn());
              return const LoaderPage("Authenticating...");
            },
            loading: () => const LoaderPage("Checking session..."),
            authenticated: () => const HomePage(),
            unauthenticated: () => const LoginPage(""),
            failure: (e) => LoginPage(e));
      },
    );
  }
}