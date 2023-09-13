part of '../home_page.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
              title: const Text("Logout"),
              content: const Text("Are you sure you want to logout?"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    bloc.add(const AuthenticationEvent.newLogoutEvent());
                    Navigator.pop(context);
                  },
                  child: const Text("Logout"),
                )
              ],
            )),
          icon: const Icon(CupertinoIcons.lock)),
    );
  }
}
