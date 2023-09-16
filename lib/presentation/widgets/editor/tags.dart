import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ptf/local.dart';
import 'package:ptf/presentation/widgets/input_field.dart';

class TagsWidget extends StatelessWidget {
  final ValueChanged<String> onAddTag;
  final ValueChanged<String> onRemoveTag;
  final List<String> tags;
  const TagsWidget({super.key, required this.onAddTag, required this.tags, required this.onRemoveTag});

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context)!;
    TextEditingController controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.grey.shade300, width: 2),
        ),
        color: Colors.white,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(labels.tags, style: Theme.of(context).textTheme.titleMedium),
              Wrap(
                children: [ ...tags.map((e) => Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  child: ActionChip(
                    label: Text(e),
                    onPressed: () {
                      showDialog(context: context, builder: (delete){
                        return AlertDialog(
                          title: Text("${labels.deleteTag} \'$e\'"),
                          content: Text(labels.deleteTagMessage),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(labels.cancel),
                            ),
                            TextButton(
                              onPressed: () {
                                onRemoveTag(e);
                              },
                              child: Text(labels.deleteTag),
                            )
                          ],
                        );
                      });
                    },
                    ),
                )).toList(),  ActionChip(
                  label: Text("${labels.add} +"),
                  backgroundColor: Colors.grey.shade200,
                  labelStyle: TextStyle(color: Colors.grey.shade700),
                  onPressed: (){
                    showDialog(context: context, builder: (modalctx){
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InputField(label: labels.tag, controller: controller,icon: CupertinoIcons.tag,),
                            CupertinoButton(
                                onPressed: () {
                                  onAddTag(controller.text);
                                  controller.clear();
                                }, child: Text(labels.add),
                                color: CupertinoColors.systemPink
                            )
                          ],
                        ),
                      );
                    });
                  },)
                ],
              ),
            ],
          ),
        )
      ),
    );
  }

}
