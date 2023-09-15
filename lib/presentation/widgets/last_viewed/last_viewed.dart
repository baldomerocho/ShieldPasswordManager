import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptf/domain/entities/entities.dart';
import 'package:ptf/local.dart';
import 'package:ptf/presentation/blocs/blocs.dart';
import 'package:ptf/presentation/widgets/get_all_passwords.dart';
import 'package:ptf/presentation/widgets/password_item_button/password_item_button.dart';

class LastViewedWidget extends StatelessWidget {
  const LastViewedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context)!;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BlocBuilder<TakeLastViewsBloc, TakeLastViewsState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Container(),
            initial: () {
              BlocProvider.of<TakeLastViewsBloc>(context).add(const TakeLastViewsEvent.watch());
              return Container();
            },
            loading: () => CupertinoActivityIndicator(),
            streamLoaded: (stream) => StreamBuilder<List<PasswordEntity>>(
              stream: stream,
              builder: (context, snapshot) {
                return CupertinoListSection.insetGrouped(
                  backgroundColor: Colors.orange,
                    header: Text(labels.latestViewed, style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold
                    )),
                    children: snapshot.data?.map((e) => PasswordItemButton(pass:e)).toList(),
                    footer: GetAllPasswordsButton(message: labels.viewedCard)
                );
              }
            ),
          );
        },
      ),
    );
  }
}
