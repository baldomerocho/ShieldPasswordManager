import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptf/domain/entities/entities.dart';
import 'package:ptf/local.dart';
import 'package:ptf/presentation/blocs/blocs.dart';
import 'package:ptf/presentation/widgets/get_all_passwords.dart';
import 'package:ptf/presentation/widgets/password_item_button/password_item_button.dart';

class LastCreatedWidget extends StatelessWidget {
  const LastCreatedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context)!;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BlocBuilder<TakeLastCreatedBloc, TakeLastCreatedState>(
        builder: (context, state) {
          return state.maybeWhen(
              orElse: ()=> Container(),
              initial: (){
                context.read<TakeLastCreatedBloc>().add(const TakeLastCreatedEvent.watch());
                return Container();
              },
              streamLoaded:(stream) => StreamBuilder<List<PasswordEntity>>(
                stream: stream,
                builder: (context, snapshot) {
                  final data = snapshot.data;
                  return CupertinoListSection.insetGrouped(
                    backgroundColor: Colors.pink,
                    header: Text(labels.latestAdded, style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold
                    )),
                    children: data?.map((e) => PasswordItemButton(pass:e)).toList(),
                    footer: GetAllPasswordsButton(message: labels.latestAddedCard)
            );
                }
              ));
        },
      ),
    );
  }
}
