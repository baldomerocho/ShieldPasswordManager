part of '../home_page.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context)!;
    var bloc = context.read<AuthenticationBloc>();
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        state.maybeWhen(
            orElse: () {},
            initial: () {
              context.read<SessionBloc>().add(const SessionEvent.loggedIn());
            });
      },
      builder: (context, state) => IconButton(
          onPressed: () =>
            showDialog(context: context, builder: (_) => AlertDialog(
              title: Text(labels.logout),
              content: Text(labels.logoutMessage),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(labels.cancel),
                ),
                TextButton(
                  onPressed: () {
                    bloc.add(const AuthenticationEvent.newLogoutEvent());
                    Navigator.pop(context);
                  },
                  child: Text(labels.logout)
                )
              ],
            )),
          icon: const Icon(CupertinoIcons.lock)),
    );
  }
}
