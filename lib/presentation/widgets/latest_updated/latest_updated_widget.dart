import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptf/domain/entities/entities.dart';
import 'package:ptf/presentation/blocs/blocs.dart';
import 'package:ptf/presentation/widgets/get_all_passwords.dart';

class LatestUpdatedWidget extends StatelessWidget {
  const LatestUpdatedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BlocBuilder<TakeLatestUpdatedBloc, TakeLatestUpdatedState>(
        builder: (context, state) {
          return state.maybeWhen(
              orElse: ()=> Container(),
              initial: (){
                context.read<TakeLatestUpdatedBloc>().add(const TakeLatestUpdatedEvent.watch());
                return Container();
              },
              streamLoaded:(stream) => StreamBuilder<List<PasswordEntity>>(
                  stream: stream,
                  builder: (context, snapshot) {
                    final data = snapshot.data;
                    return CupertinoListSection.insetGrouped(
                        backgroundColor: Colors.deepPurple,
                        header: Text("Latest 5 updated", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold
                        )),
                        children: data?.map((e) => CupertinoListTile(title: Text(e.username), subtitle: Text(e.website),)).toList(),
                        footer: GetAllPasswordsButton(message: "Mostrando las últimas 5 contraseñas editadas")
                    );
                  }
              ));
        },
      ),
    );
  }
}
