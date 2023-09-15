import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptf/application/models/password_model.dart';
import 'package:ptf/domain/entities/password_entity.dart';
import 'package:ptf/presentation/blocs/blocs.dart';
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
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _websiteController = TextEditingController();
  String _categoryID = "";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
    } else {
      if(kDebugMode){
        _websiteController.text = "google.com";
        _usernameController.text = "user";
        _passwordController.text = "password";
      }
    }

    _animationController = AnimationController(
      vsync: this, // "this" se refiere a la instancia de _MyWidgetState
      duration: Duration(seconds: 2),
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
    return Scaffold(
      body: Form(
        key: _formKey,
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(delegate: PersistentHeaderEditor(
              height: 200,
              status: isCreate,
              animationController:_animationController,
              ), floating: true, pinned: false,),
            SliverPadding(
              padding: EdgeInsets.only(left: 16),
              sliver: SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Text(
                    "Credential",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )
                  ),
                ),
              ),
            ),
            SliverPadding(padding: EdgeInsets.all(16), sliver:
            SliverList(delegate: SliverChildListDelegate([
              InputDropdown(
                initialValue: _categoryID,
                validatorMessage: "required",
                label: "Categoríes",
                onChanged: (value) {
                  _categoryID = value;
                },
              ),
              InputField(controller: _websiteController,
                label: "Site Address",
                icon: Icons.cloud,
                iconColor: Colors.pink,
                validatorMessage: "required",),
              InputField(controller: _usernameController,
                  label: "User Name",
                  icon: Icons.person,
                  iconColor: Colors.pink,
                  validatorMessage: "required"),
              InputField(controller: _passwordController,
                  label: "Password",
                  icon: Icons.lock,
                  iconColor: Colors.pink,
                  validatorMessage: "required"),
            ]))
            ),
            SliverToBoxAdapter(child: SizedBox(height: 500))
          ],
        ),
      ),
      bottomSheet: isCreate ? _createButton(context, _formKey) : _updateButton(context,  _formKey)
    );
  }

  Widget _createButton(BuildContext context, _formKey) {
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
              print("error");
            },
            loading: (_) {
              print("loading");
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Row(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(width: 16),
                        Text("Saving..."),
                      ],
                    ),
                  );
                },
              );
            }
        );
      },
      builder: (context, state) {
        return Container(
          height: kToolbarHeight + (kToolbarHeight / 4),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 10),
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
                  );
                  print(password);
                  if (_formKey.currentState!.validate() &&
                      password.categoryId.isNotEmpty) {
                    context.read<SavePassBloc>()
                        .add(SavePassEvent.send(password: password));
                  } else {
                    print("error ${_formKey.currentState!.validate()}}");
                  }
                },
                child: Text("Save"),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _updateButton(BuildContext context, _formKey) {
    return BlocConsumer<UpdatePassBloc, UpdatePassState>(
      listener: (context, state) {
        state.maybeMap(
            orElse: () {},
            success: (updated) async {
              Navigator.of(context).pop();
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
                        CircularProgressIndicator(),
                        SizedBox(width: 16),
                        Text("Saving..."),
                      ],
                    ),
                  );
                },
              );
            }
        );
      },
      builder: (context, state) {
        return Container(
          height: kToolbarHeight + (kToolbarHeight / 4),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width * 0.9,
              child: CupertinoButton(
                color: CupertinoColors.systemPink,
                onPressed: () {
                  PasswordModel password = PasswordModel(
                    website: _websiteController.text,
                    username: _usernameController.text,
                    password: _passwordController.text,
                    categoryId: _categoryID,
                    createdAt: passEditing != null ? passEditing.createdAt : DateTime.now(),
                    updatedAt: DateTime.now(),
                    favorite: passEditing.favorite,
                    latestViewed: DateTime.now(),
                    safe: passEditing.safe,
                  );
                  print(password);
                  if (_formKey.currentState!.validate() &&
                      password.categoryId.isNotEmpty) {
                    context.read<UpdatePassBloc>()
                        .add(UpdatePassEvent.send(password: password, id: passEditing.id));
                  }
                },
                child: Text("Update"),
              ),
            ),
          ),
        );
      },
    );
  }
}
