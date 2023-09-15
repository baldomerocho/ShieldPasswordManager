import 'package:flutter/material.dart';
import 'package:ptf/local.dart';

class GetAllPasswordsButton extends StatelessWidget {
  final String message;
  final String? label;
  const GetAllPasswordsButton({super.key, required this.message, this.label});

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context)!;
    return Row(
      children: [
        Expanded(
            child: Text(message,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                height: 1.2
              )
            )
        ),
        ElevatedButton(child: Text(label??labels.getAll), onPressed: (){
          Navigator.pushNamed(context, "/passwords");
        }),
      ],
    );
  }
}
