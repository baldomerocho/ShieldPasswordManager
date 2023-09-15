import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptf/application/models/password_model.dart';
import 'package:ptf/domain/entities/password_entity.dart';
import 'package:ptf/presentation/blocs/blocs.dart';
import 'package:ptf/presentation/widgets/input_field.dart';

class PasswordEditor extends StatefulWidget {
  final bool isCreate;
  final PasswordEntity? password;
  const PasswordEditor({super.key, this.isCreate = true, this.password});

  static const routeName = "/password_editor";

  @override
  State<PasswordEditor> createState() => _PasswordEditorState();
}

class _PasswordEditorState extends State<PasswordEditor> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _websiteController = TextEditingController();
  String _categoryID = "";
  bool _saved = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _usernameController.dispose();
    _websiteController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 150.0,
              backgroundColor: Colors.pink.shade50,
              foregroundColor: Colors.pink.shade900,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                    isCreate ? "Create New Vaults" : "Update Password"),
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
                icon: Icons.network_wifi_outlined,
                iconColor: Colors.pink,
                validatorMessage: "required",),
              InputField(controller: _usernameController,
                  label: "User Name",
                  icon: Icons.network_wifi_outlined,
                  iconColor: Colors.pink,
                  validatorMessage: "required"),
              InputField(controller: _passwordController,
                  label: "Password",
                  icon: Icons.network_wifi_outlined,
                  iconColor: Colors.pink,
                  validatorMessage: "required"),
              Icon(Icons.verified, color: _saved ? Colors.teal : Colors.grey.shade300, size: 50,)
            ]))
            ),
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
                _saved = true;
                isCreate = false;
              });
              await Future.delayed(Duration(seconds: 1));
              setState(() {
                _saved = false;
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
                _saved = true;
                isCreate = false;
              });
              await Future.delayed(Duration(seconds: 1));
              setState(() {
                _saved = false;
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
