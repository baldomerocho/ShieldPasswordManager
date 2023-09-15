import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptf/domain/entities/entities.dart';
import 'package:ptf/presentation/blocs/blocs.dart';
import 'package:ptf/presentation/widgets/password_item_button/password_item_button.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  static const routeName = "/favourites";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Favourites"),
        ),
        body: BlocBuilder<WatchPassFavouritesBloc, WatchPassFavouritesState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => SizedBox.shrink(),
              initial: () {
                context.read<WatchPassFavouritesBloc>().add(WatchPassFavouritesEvent.watch());
                return CircularProgressIndicator();
              },
              loading: () => CircularProgressIndicator(),
              streamLoaded: (stream) => StreamBuilder<List<PasswordEntity>>(
                stream: stream,
                builder: (context, snapshot){
                  final data = snapshot.data;
                  if(!snapshot.hasData){
                    return Text("no data");
                  }
                  if(data!.isEmpty){
                    return Center(child: Text("Empty"));
                  }
                  return ListView.builder(itemBuilder: (contex,index){
                    return PasswordItemButton(pass: data![index]);
                  }, itemCount: data?.length,);
                },
              )
            );
          },
        )
    );
  }
}
