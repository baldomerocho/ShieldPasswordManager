import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:ptf/domain/entities/password_entity.dart';
import 'package:ptf/local.dart';
import 'package:ptf/presentation/blocs/blocs.dart';
import 'package:ptf/presentation/widgets/password_item_button/password_item_button.dart';

import 'persistent_header_passwords.dart';

class PasswordsPage extends StatelessWidget {
  const PasswordsPage({super.key});
  static const routeName = "/passwords";

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final labels = AppLocalizations.of(context)!;
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(delegate: PersistentHeaderPasswords(
              formKey: formKey,
              controller: searchController,
              height: 220
            ), pinned: true),
            BlocBuilder<WatchPasswordsBloc, WatchPasswordsState>(
              builder: (context, state) {
                return state.maybeWhen(
                    orElse: () => SliverFillViewport(delegate: SliverChildListDelegate([const CircularProgressIndicator()])),
                    initial: () {
                      context.read<WatchPasswordsBloc>().add(WatchPasswordsEvent.watchPasswords(""));
                      return SliverFillViewport(delegate: SliverChildListDelegate([const CircularProgressIndicator()]));
                    },
                    streamLoaded: (stream) {
                        return StreamBuilder<List<PasswordEntity>>(
                          stream: stream,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final data = snapshot.data;
                              if(data!.isEmpty){
                                SliverFillViewport(delegate: SliverChildListDelegate([
                                  Center(
                                    child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                    Lottie.asset("assets/lotties/animation_lmk2dmhq.json"),
                                      Text(labels.noPasswordsYet)
                                      ],
                                    ),
                                  )
                                ]));
                              }
                              return SliverFillRemaining(
                                  child: CupertinoListSection.insetGrouped(
                                    header: Text(labels.passwords, style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                        fontWeight: FontWeight.bold
                                    )),
                                    children: data.map((e) => PasswordItemButton(pass: e)).toList(),
                                  ));
                            } else {
                             return SliverFillViewport(delegate: SliverChildListDelegate([const CircularProgressIndicator()]));
                            }
                          }
                        );
                    },
                    error: (message) => SliverFillViewport(delegate: SliverChildListDelegate([Text(message)])),
                );
              },
            ),
          ],
        ),
    );
  }

}
