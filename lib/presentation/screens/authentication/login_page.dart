import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptf/application/models/buttons.dart';
import 'package:ptf/local.dart';
import 'package:ptf/presentation/blocs/authentication/authentication_provider.dart';
import 'package:ptf/presentation/blocs/blocs.dart';
import 'package:ptf/presentation/screens/authentication/login_form_widget.dart';
import 'package:ptf/presentation/utils/utils.dart';

import '../../widgets/loader_page.dart';

class LoginPage extends StatelessWidget {
  final String message;
  const LoginPage(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    var ctx = context.read<AuthenticationBloc>();
    List<LoginOption> options = [
      LoginOption(name: "Email", icon: "assets/images/email.png" , onPressed: ()=> showGeneralDialog(context: context, pageBuilder: (ctx, anim1, anim2)=> const Dialog(
        child: LoginFormWidget()
      ),
        transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
          child: FadeTransition(
            opacity: anim1,
            child: child,
          ),
        ),
      )),
      LoginOption(name: "Google", icon: "assets/images/google.png" , onPressed: ()=> ctx.add(const AuthenticationEvent.newLoginEvent(AuthenticationProvider.google))),
      LoginOption(name: "X", icon:"assets/images/twitter.png", onPressed: ()=> ctx.add(const AuthenticationEvent.newLoginEvent(AuthenticationProvider.twitter))),
      LoginOption(name: "Apple", icon:"assets/images/apple.png", onPressed: ()=> ctx.add(const AuthenticationEvent.newLoginEvent(AuthenticationProvider.apple)))
    ];
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        state.maybeWhen(
            orElse: () {},
            failure: (error) {
              Noti.snackWarning(context:context, message:error);
            },
            success: () {
              context.read<SessionBloc>().add(const SessionEvent.loggedIn());
            });
      },
      builder: (context,state) => state.maybeWhen(
          orElse: () => _buildLoginOptions(options, context),
          loading: () => const LoaderPage("Autehticating..."),
      ),
    );
  }

  Widget _buildLoginOptions(List<LoginOption> options, BuildContext context) {
    final labels = AppLocalizations.of(context)!;
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 100,
              title: Text("Shield Password Manager", style: Theme.of(context).textTheme.titleLarge),
              centerTitle: true,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Center(
                        child: Image.asset('assets/images/shield.png', height: 100,)
                    ),
                    const SizedBox(height: 50,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CupertinoListSection.insetGrouped(
                        backgroundColor: Colors.grey.shade200,
                        header: Text(labels.login, style: Theme.of(context).textTheme.titleLarge),
                        footer: const Text("Version 0.0.1", style: TextStyle(color: CupertinoColors.inactiveGray),),
                        children: [
                          ...options.map((e) => CupertinoListTile(
                              onTap: e.onPressed,
                              title:Text("${labels.signInWith} ${e.name}"),
                              leading: Image.asset(e.icon, height: 20,),
                          )).toList(),
                        ],
                      ),
                    )
                    // ...options.map((e) => ElevatedButton(
                    //     style: ElevatedButton.styleFrom(
                    //       elevation: 0,
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(10),
                    //           side: BorderSide(color: Colors.pink.shade100, width: 1)
                    //       ),
                    //     ),
                    //     onPressed: e.onPressed, child: Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Image.asset(e.icon, height: 25,),
                    //     const VerticalDivider(),
                    //     Text(labels.signInWith(e.name), style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    //         fontWeight: FontWeight.w600
                    //     ))],
                    // ))).toList()
                  ],
                ),
              ),
            )
          ],
        ));
  }
}


class ButtonStyle {

}