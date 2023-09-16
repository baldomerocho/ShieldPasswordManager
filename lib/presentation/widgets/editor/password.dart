// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptf/application/models/password_model.dart';
import 'package:ptf/domain/entities/password_entity.dart';
import 'package:ptf/local.dart';
import 'package:ptf/presentation/blocs/blocs.dart';
import 'package:ptf/presentation/widgets/editor/tags.dart';
import 'package:ptf/presentation/widgets/input_field.dart';

import 'persistent_header_editor.dart';

class PasswordEditor extends StatefulWidget {
  final bool isCreate;
  final PasswordEntity? password;
  const PasswordEditor({super.key, this.isCreate = true, this.password});

  static const routeName = "/password_editor";

  @override
  State<PasswordEditor> createState() => _PasswordEditorState();
}

class _PasswordEditorState extends State<PasswordEditor> with SingleTickerProviderStateMixin{
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  String _categoryID = "";
  List<String> _tags = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late AnimationController _animationController;

  late PasswordEntity passEditing;
  bool isCreate = true;

  @override
  void initState() {
    isCreate = widget.isCreate;

    if(widget.password != null){
      passEditing = widget.password!;
      _websiteController.text = passEditing.website;
      _usernameController.text = passEditing.username;
      _passwordController.text = passEditing.password;
      _categoryID = passEditing.categoryId;
      _tags = passEditing.tags;
    } else {
      if(kDebugMode){
        _websiteController.text = "google.com";
        _usernameController.text = "user";
        _passwordController.text = "password";
      }
    }

    _animationController = AnimationController(
      vsync: this, // "this" se refiere a la instancia de _MyWidgetState
      duration: const Duration(seconds: 2),
    );

    _animationController.addListener(() {
      // Se llama cada vez que cambia el valor de la animación
    });

    _animationController.addStatusListener((status) {
      // Se llama cuando cambia el estado de la animación (completa, reinicia, etc.)
    });


    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _usernameController.dispose();
    _websiteController.dispose();
    _formKey.currentState?.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context)!;
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: _formKey,
          child: CustomScrollView(
            slivers: [
              SliverPersistentHeader(delegate: PersistentHeaderEditor(
                height: 200,
                status: isCreate,
                animationController:_animationController,
                ), floating: true, pinned: false,),

              SliverPadding(padding: const EdgeInsets.all(8), sliver:
              SliverList(delegate: SliverChildListDelegate([
                Card(
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
                      mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                          labels.credential,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          )
                      ),
                      InputDropdown(
                        initialValue: _categoryID,
                        validatorMessage: labels.categoriesRequired,
                        label: labels.categories,
                        onChanged: (value) {
                          _categoryID = value;
                        },
                      ),
                      InputField(controller: _websiteController,
                        label: labels.siteAddress,
                        icon: Icons.cloud,
                        iconColor: Colors.pink,
                        validatorMessage: labels.siteAddressRequired,),
                      InputField(controller: _usernameController,
                          label: labels.username,
                          icon: Icons.person,
                          iconColor: Colors.pink,
                          validatorMessage: labels.usernameRequired),
                      InputField(controller: _passwordController,
                          label: labels.password,
                          icon: Icons.lock,
                          iconColor: Colors.pink,
                          validatorMessage: labels.passwordRequired),
                    ],
                ),
                  ),)
              ]))
              ),
              SliverToBoxAdapter(child: TagsWidget(onAddTag: (String value){
                setState(() {
                  _tags = [..._tags, value];
                });
                Navigator.pop(context);
              }, onRemoveTag: (String value){
                setState(() {
                  _tags = _tags.where((element) => element != value).toList();
                });
                Navigator.pop(context);
              },tags: _tags),),
              SliverToBoxAdapter(child: isCreate ? _createButton(context, _formKey,labels) : _updateButton(context,  _formKey,labels),)
            ],
          ),
        ),
      ),
    );
  }

  Widget _createButton(BuildContext context, formKey, labels) {
    return BlocConsumer<SavePassBloc, SavePassState>(
      listener: (context, state) {
        state.maybeMap(
            orElse: () {},
            success: (created) async {
              Navigator.of(context).pop();
              setState(() {
                passEditing = created.pass;
                isCreate = false;
              });
            },
            error: (_){
              Navigator.of(context).pop();
            },
            loading: (_) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Row(
                      children: [
                        const CircularProgressIndicator(),
                        const SizedBox(width: 16),
                        Text(labels.saving),
                      ],
                    ),
                  );
                },
              );
            }
        );
      },
      builder: (context, state) {
        return SizedBox(
          height: kToolbarHeight + (kToolbarHeight / 4),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.9,
              child: CupertinoButton(
                color: CupertinoColors.systemPink,
                onPressed: () {
                  PasswordModel password = PasswordModel(
                    website: _websiteController.text,
                    username: _usernameController.text,
                    password: _passwordController.text,
                    categoryId: _categoryID,
                    createdAt: DateTime.now(),
                    updatedAt: DateTime.now(),
                    favorite: false,
                    latestViewed: DateTime.now(),
                    safe: true,
                    tags: _tags
                  );
                  if (formKey.currentState!.validate() &&
                      password.categoryId.isNotEmpty) {
                    context.read<SavePassBloc>()
                        .add(SavePassEvent.send(password: password));
                  } else {
                  }
                },
                child: Text(labels.save),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _updateButton(BuildContext context, formKey, labels) {
    return BlocConsumer<UpdatePassBloc, UpdatePassState>(
      listener: (context, state) {
        state.maybeMap(
            orElse: () {},
            success: (updated) async {
              Navigator.of(context).pop();
              context.read<CountPassVulnerableBloc>().add(CountPassVulnerableEvent.count());
              setState(() {
                passEditing = updated.pass;
                isCreate = false;
              });
            },
            error: (_){
              Navigator.of(context).pop();
            },
            loading: (_) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Row(
                      children: [
                        const CircularProgressIndicator(),
                        const SizedBox(width: 16),
                        Text(labels.saving),
                      ],
                    ),
                  );
                },
              );
            }
        );
      },
      builder: (context, state) {
        return SizedBox(
          height: kToolbarHeight + (kToolbarHeight / 4),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width * 0.9,
              child: CupertinoButton(
                color: CupertinoColors.systemPink,
                onPressed: () async {
                  PasswordModel password = PasswordModel(
                    website: _websiteController.text,
                    username: _usernameController.text,
                    password: _passwordController.text,
                    categoryId: _categoryID,
                    createdAt: passEditing != null ? passEditing.createdAt : DateTime.now(),
                    updatedAt: DateTime.now(),
                    favorite: passEditing.favorite,
                    latestViewed: DateTime.now(),
                    safe: true,
                    tags: _tags
                  );
                  if (formKey.currentState!.validate() &&
                      password.categoryId.isNotEmpty) {
                    context.read<UpdatePassBloc>()
                        .add(UpdatePassEvent.send(password: password, id: passEditing.id));

                  }
                },
                child: Text(labels.update),
              ),
            ),
          ),
        );
      },
    );
  }
}
