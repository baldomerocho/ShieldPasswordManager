import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ptf/presentation/widgets/input_field.dart';

class PasswordEditor extends StatelessWidget {
  const PasswordEditor({super.key});
  static const routeName = "/password_editor";

  @override
  Widget build(BuildContext context) {
    final List? arguments = ModalRoute.of(context)!.settings.arguments as List?;
    final bool? isCreate = arguments![0] as bool?;
    final List? data = arguments[1] as List?;

    TextEditingController _nameController = TextEditingController();

    return Scaffold(
      body: CustomScrollView(
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
              InputDropdown(items: ["Opciones"],label: "Categoríes",),
              InputField(controller: _nameController,label: "Site Address", icon: Icons.network_wifi_outlined, iconColor: Colors.pink,),
              InputField(controller: _nameController,label: "User Name", icon: Icons.network_wifi_outlined, iconColor: Colors.pink,),
              InputField(controller: _nameController,label: "Password", icon: Icons.network_wifi_outlined, iconColor: Colors.pink,),
            ]))
          ),

          SliverPadding(padding: EdgeInsets.all(16), sliver:
            SliverList(delegate: SliverChildListDelegate([
              Text("Categoríes", style: Theme.of(context).textTheme.titleLarge),
              InputDropdown(items: ["Opciones"],label: "Categoríes",),
              InputField(controller: _nameController,label: "Site Address", icon: Icons.network_wifi_outlined, iconColor: Colors.pink,),
              InputField(controller: _nameController,label: "User Name", icon: Icons.network_wifi_outlined, iconColor: Colors.pink,),
              InputField(controller: _nameController,label: "Password", icon: Icons.network_wifi_outlined, iconColor: Colors.pink,),
            ]))
          )
        ],
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
              onPressed: () {},
              child: Text("Save"),
            ),
          ),
        ),
      ),
    );
  }
}
