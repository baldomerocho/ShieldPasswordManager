import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptf/domain/entities/entities.dart';
import 'package:ptf/local.dart';
import 'package:ptf/presentation/blocs/blocs.dart';
import 'package:ptf/presentation/blocs/data/set_pass_favourite/set_pass_favourite_bloc.dart';
import 'package:ptf/presentation/widgets/editor/password.dart';

class PasswordItemButton extends StatelessWidget {
  final PasswordEntity pass;
  const PasswordItemButton({super.key, required this.pass});

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context)!;
    return CupertinoListTile(
      onTap: () {
        context.read<SetViewedBloc>().add(SetViewedEvent.send(pass.id));
        Navigator.push(context, MaterialPageRoute(builder: (_) => PasswordEditor(password: pass, isCreate:false)));
      },
      title: Text(pass.username),
      subtitle: Text(pass.website),
      leading: CachedNetworkImage(
        imageUrl: "https://www.google.com/s2/favicons?sz=64&domain_url=${pass.website}",
        errorWidget: (context, url, error) => Icon(CupertinoIcons.globe),
        placeholder: (context, url) => CupertinoActivityIndicator(),
      ),
      additionalInfo: IconButton(icon: pass.favorite ? Icon(CupertinoIcons.star_fill, color: Colors.orange) : Icon(CupertinoIcons.star,color: Colors.orange), onPressed: (){
        context.read<SetPassFavouriteBloc>().add(SetPassFavouriteEvent.setPassFavourite(passId: pass.id, value: !pass.favorite));
      }),
      trailing: IconButton(onPressed: (){
                _deleteConfirmation(context, pass.id, labels);
              }, icon: Icon(CupertinoIcons.delete_solid, color: Colors.pink.shade200)),
    );
  }

  _deleteConfirmation(BuildContext context, String id, AppLocalizations labels) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(labels.deletePassword),
          content: Text(labels.deletePasswordMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(labels.cancel),
            ),
            TextButton(
              onPressed: () {
                context.read<DeletePassBloc>().add(DeletePassEvent.send(id: id));
                Navigator.of(context).pop();
              },
              child: Text(labels.delete),
            ),
          ],
        );
      },
    );
  }
}
