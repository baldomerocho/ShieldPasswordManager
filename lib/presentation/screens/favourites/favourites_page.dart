import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:ptf/domain/entities/entities.dart';
import 'package:ptf/local.dart';
import 'package:ptf/presentation/blocs/blocs.dart';
import 'package:ptf/presentation/widgets/password_item_button/password_item_button.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  static const routeName = "/favourites";

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context)!;
    return Scaffold(
        appBar: AppBar(
          title: Text(labels.myFavourites),
        ),
        body: BlocBuilder<WatchPassFavouritesBloc, WatchPassFavouritesState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const SizedBox.shrink(),
              initial: () {
                context.read<WatchPassFavouritesBloc>().add(WatchPassFavouritesEvent.watch());
                return const CircularProgressIndicator();
              },
              loading: () => const CircularProgressIndicator(),
              streamLoaded: (stream) => StreamBuilder<List<PasswordEntity>>(
                stream: stream,
                builder: (context, snapshot){
                  final data = snapshot.data;
                  if(!snapshot.hasData){
                    return Text(labels.noData);
                  }
                  if(data!.isEmpty){
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset("assets/lotties/animation_lmk2dmhq.json"),
                          Text(labels.noPasswordsYet)
                        ],
                      ),
                    );
                  }
                  return CupertinoListSection.insetGrouped(
                    header: Text(labels.myFavourites),
                    children: data.map((e) => PasswordItemButton(pass: e)).toList(),
                  );
                },
              )
            );
          },
        )
    );
  }
}
