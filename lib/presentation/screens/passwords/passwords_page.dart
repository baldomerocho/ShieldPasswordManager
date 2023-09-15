import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_fade/image_fade.dart';
import 'package:lottie/lottie.dart';
import 'package:ptf/domain/entities/password_entity.dart';
import 'package:ptf/presentation/blocs/blocs.dart';
import 'package:ptf/presentation/widgets/editor/password.dart';
import 'package:ptf/presentation/widgets/input_field.dart';
import 'package:ptf/presentation/widgets/password_item_button/password_item_button.dart';

import 'persistent_header_passwords.dart';

class PasswordsPage extends StatelessWidget {
  const PasswordsPage({super.key});
  static const routeName = "/passwords";

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(delegate: PersistentHeaderPasswords(
              formKey: _formKey,
              controller: _searchController,
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
                                      Text('No passwords yet')
                                      ],
                                    ),
                                  )
                                ]));
                              }
                              return SliverList(delegate: SliverChildBuilderDelegate((context, index) {
                                return PasswordItemButton(pass: data[index]);
                              }, childCount: data.length));
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
