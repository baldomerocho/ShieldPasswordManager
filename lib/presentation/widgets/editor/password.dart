import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptf/application/models/password_model.dart';
import 'package:ptf/presentation/blocs/blocs.dart';
import 'package:ptf/presentation/widgets/input_field.dart';

class PasswordEditor extends StatelessWidget {
  const PasswordEditor({super.key});
  static const routeName = "/password_editor";

  @override
  Widget build(BuildContext context) {
    final List? arguments = ModalRoute.of(context)!.settings.arguments as List?;
    final bool? isCreate = arguments![0] as bool?;
    final List? data = arguments[1] as List?;

    TextEditingController _passwordController = TextEditingController();
    TextEditingController _usernameController = TextEditingController();
    TextEditingController _faviconController = TextEditingController();
    TextEditingController _websiteController = TextEditingController();
    String _categoryID = "";
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return BlocConsumer<SavePassBloc, SavePassState>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () {},
          success: (_) {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
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
                    title: Text(isCreate! ? "Create New Vaults" : "Update Password"),
                  ),
                ),
                SliverPadding(padding: EdgeInsets.all(16), sliver:
                  SliverList(delegate: SliverChildListDelegate([
                    InputDropdown(
                      validatorMessage: "required",
                        items: ["Opciones"],
                        label: "Categoríes",
                        onChanged: (value) {
                          _categoryID = value;
                        },
                      ),
                      InputField(controller: _websiteController,label: "Site Address", icon: Icons.network_wifi_outlined, iconColor: Colors.pink,validatorMessage: "required",),
                    InputField(controller: _faviconController,label: "Site Address", icon: Icons.network_wifi_outlined, iconColor: Colors.pink,validatorMessage: "required"),
                    InputField(controller: _usernameController,label: "User Name", icon: Icons.network_wifi_outlined, iconColor: Colors.pink,validatorMessage: "required"),
                    InputField(controller: _passwordController,label: "Password", icon: Icons.network_wifi_outlined, iconColor: Colors.pink,validatorMessage: "required"),
                  ]))
                ),

                // SliverPadding(padding: EdgeInsets.all(16), sliver:
                //   SliverList(delegate: SliverChildListDelegate([
                //     Text("Categoríes", style: Theme.of(context).textTheme.titleLarge),
                //     InputDropdown(items: ["Opciones"],label: "Categoríes",),
                //     InputField(controller: _nameController,label: "Site Address", icon: Icons.network_wifi_outlined, iconColor: Colors.pink,),
                //     InputField(controller: _nameController,label: "User Name", icon: Icons.network_wifi_outlined, iconColor: Colors.pink,),
                //     InputField(controller: _nameController,label: "Password", icon: Icons.network_wifi_outlined, iconColor: Colors.pink,),
                //   ]))
                // )
              ],
            ),
          ),
          bottomSheet: Container(
            height: kToolbarHeight + (kToolbarHeight/4),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top:10),
                width: MediaQuery.of(context).size.width * 0.9,
                child: CupertinoButton(
                  color: CupertinoColors.systemPink,
                  onPressed: () {
                    PasswordModel password = PasswordModel(
                      favicon: _faviconController.text,
                      website: _websiteController.text,
                      username: _usernameController.text,
                      password: _passwordController.text,
                      categoryId: _categoryID,
                    );
                    if (_formKey.currentState!.validate() && _categoryID.isNotEmpty) {
                      print("saving");
                      context.read<SavePassBloc>()
                          .add(SavePassEvent.send(password: password));
                    }
                  },
                  child: Text("Save"),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
