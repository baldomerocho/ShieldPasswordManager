import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_fade/image_fade.dart';
import 'package:ptf/domain/entities/entities.dart';
import 'package:ptf/presentation/blocs/blocs.dart';
import 'package:ptf/presentation/blocs/data/set_pass_favourite/set_pass_favourite_bloc.dart';
import 'package:ptf/presentation/widgets/editor/password.dart';

class PasswordItemButton extends StatelessWidget {
  final PasswordEntity pass;
  const PasswordItemButton({super.key, required this.pass});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<SetViewedBloc>().add(SetViewedEvent.send(pass.id));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PasswordEditor(password: pass,isCreate:false),
          ));
      },
      child: Card(
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            color: Colors.grey.shade300,
            width: 2.0
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                child: Center(
                  child: ImageFade(
                        alignment: Alignment.center,
                        placeholder: Container(
                          color: const Color(0xFFCFCDCA),
                          alignment: Alignment.center,
                          child: const Icon(Icons.photo, color: Colors.white30, size: 20.0),
                        ),
                        loadingBuilder: (context, progress, chunkEvent) =>
                            Center(child: CircularProgressIndicator(value: progress)),
                        image: NetworkImage('https://www.google.com/s2/favicons?domain=${pass.website}'),
                        fit: BoxFit.contain,
                        errorBuilder: (___,_) => Image.asset('assets/images/cancel.png'),
                      ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(pass.username, style: Theme.of(context).textTheme.titleMedium),
                    Text(pass.website, style: Theme.of(context).textTheme.titleSmall),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(onPressed: (){
                    context.read<SetPassFavouriteBloc>().add(SetPassFavouriteEvent.setPassFavourite(passId: pass.id, value: !pass.favorite));
                  }, icon: pass.favorite ? Icon(Icons.star, color: Colors.orange,) : Icon(Icons.star_border,color: Colors.orange)),

                  IconButton(onPressed: (){
                    _deleteConfirmation(context, pass.id);
                  }, icon: Icon(Icons.delete_outline, color: Colors.pink.shade200)),
                ],
              )
            ],
          ),
        ),
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
