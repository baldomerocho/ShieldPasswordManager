import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_fade/image_fade.dart';
import 'package:lottie/lottie.dart';
import 'package:ptf/domain/entities/password_entity.dart';
import 'package:ptf/presentation/blocs/blocs.dart';
import 'package:ptf/presentation/widgets/editor/password.dart';
import 'package:ptf/presentation/widgets/input_field.dart';

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
              height: 200
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
                                final password = data[index];
                                return ListTile(
                                    leading: CircleAvatar(
                                        child:  ImageFade(
                                          alignment: Alignment.center,
                                          placeholder: Container(
                                            color: const Color(0xFFCFCDCA),
                                            alignment: Alignment.center,
                                            child: const Icon(Icons.photo, color: Colors.white30, size: 20.0),
                                          ),
                                          loadingBuilder: (context, progress, chunkEvent) =>
                                              Center(child: CircularProgressIndicator(value: progress)),
                                          image: NetworkImage('https://www.google.com/s2/favicons?domain=${password.website}'),
                                          fit: BoxFit.contain,
                                          errorBuilder: (___,_) => Image.asset('assets/images/cancel.png'),
                                        )
                                    ),
                                    title: Text(password.username),
                                    subtitle: Text(password.password),
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (_) => PasswordEditor(isCreate: false, password: password)));
                                    },
                                    trailing: IconButton(
                                      onPressed: () {
                                        _deleteConfirmation(context, password.id);
                                      },
                                      icon: Icon(Icons.delete_outline, color: Colors.pink.shade200),
                                    )
                                );
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
  _deleteConfirmation(BuildContext context, String id) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Delete Password"),
          content: Text("Are you sure you want to delete this password?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                context.read<DeletePassBloc>().add(DeletePassEvent.send(id: id));
                Navigator.of(context).pop();
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}
