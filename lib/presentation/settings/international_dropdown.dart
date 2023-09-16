import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ptf/presentation/blocs/app/language/language.dart';
import 'package:ptf/presentation/blocs/blocs.dart';

class InternationalButton extends StatelessWidget {
  const InternationalButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(onPressed: (){
        showLanguageBottomSheet(context);
      }, icon: Icon(Icons.translate),),
    );
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16.0),
              BlocBuilder<LanguageBloc, LanguageState>(
                builder: (context, state) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: Language.values.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          // # 1
                          // Trigger the ChangeLanguage event
                          context.read<LanguageBloc>().add(
                            ChangeLanguage(
                              selectedLanguage: Language.values[index],
                            ),
                          );
                          Future.delayed(const Duration(milliseconds: 300))
                              .then((value) => Navigator.of(context).pop());
                        },

                        title: Text(Language.values[index].text),
                        leading: ClipOval(
                          child: Image.asset(
                            Language.values[index].icon,
                            width: 30.0,
                            height: 30.0,
                          ),
                        ),
                        trailing:
                        Language.values[index] == state.selectedLanguage
                            ? const Icon(
                          Icons.check_circle_rounded,
                        )
                            : null,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.grey[300]!),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 16.0);
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
