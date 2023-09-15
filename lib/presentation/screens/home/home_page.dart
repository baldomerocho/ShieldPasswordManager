import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptf/presentation/blocs/blocs.dart';
part 'actions/logout_widget.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: const [
          LogOutWidget()
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.min,
          children: [
            Text('Home Page'),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamed('/passwords');
            }, child: Text("arriba"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/password_editor'),
        child: const Icon(Icons.add),
      )
    );
  }
}
