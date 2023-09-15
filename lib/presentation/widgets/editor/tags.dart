import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ptf/presentation/widgets/input_field.dart';

class TagsWidget extends StatelessWidget {
  final ValueChanged<String> onAddTag;
  final ValueChanged<String> onRemoveTag;
  final List<String> tags;
  const TagsWidget({super.key, required this.onAddTag, required this.tags, required this.onRemoveTag});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Tags", style: Theme.of(context).textTheme.titleMedium),
              Wrap(
                children: [ ...tags.map((e) => Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  child: ActionChip(
                    label: Text(e),
                    onPressed: () {
                      showDialog(context: context, builder: (delete){
                        return AlertDialog(
                          title: Text("Delete tag \'$e\'"),
                          content: Text("Are you sure you want to delete this tag?"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () {
                                onRemoveTag(e);
                              },
                              child: Text("Delete"),
                            )
                          ],
                        );
                      });
                    },
                    ),
                )).toList(),  ActionChip(
                  label: Text("Add +"),
                  backgroundColor: Colors.grey.shade200,
                  labelStyle: TextStyle(color: Colors.grey.shade700),
                  onPressed: (){
                    showModalBottomSheet(context: context, builder: (modalctx){
                      return Scaffold(
                        appBar: AppBar(
                          title: Text("Add tag"),
                        ),
                        body: ListView(
                          padding: const EdgeInsets.all(16.0),
                          children: [
                            InputField(label: "nombre", controller: controller,),
                            CupertinoButton(
                                onPressed: () {
                                  onAddTag(controller.text);
                                  controller.clear();
                                }, child: Text("Add"),
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
