import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptf/local.dart';
import 'package:ptf/presentation/blocs/blocs.dart';
import 'package:ptf/presentation/screens/home/notifications.dart';
import 'package:ptf/presentation/settings/international_dropdown.dart';
import 'package:ptf/presentation/widgets/favourites_card/favourites_card.dart';
import 'package:ptf/presentation/widgets/last_created/last_created_widget.dart';
import 'package:ptf/presentation/widgets/last_viewed/last_viewed.dart';
import 'package:ptf/presentation/widgets/latest_updated/latest_updated_widget.dart';
part 'actions/logout_widget.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shield Password Manager'),
        actions: const [
          LogOutWidget(),
          InternationalButton(),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          NotificationsWidget(),
          SizedBox(height: 20),
          FavouritesCard(),
          SizedBox(height: 20),
          LastViewedWidget(),
          SizedBox(height: 20),
          LastCreatedWidget(),
          SizedBox(height: 20),
          LatestUpdatedWidget(),
          SizedBox(height: 100),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/password_editor'),
        child: const Icon(Icons.add),
      )
    );
  }
}
