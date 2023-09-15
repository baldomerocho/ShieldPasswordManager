
import 'package:ptf/presentation/widgets/editor/password.dart';

import 'presentation/screens/favourites/favourites_page.dart';
import 'presentation/screens/home/home_page.dart';
import 'presentation/screens/passwords/passwords_page.dart';

class RoutesApp{
  static final way = {
    PasswordEditor.routeName: (context) => const PasswordEditor(),
    HomePage.routeName: (context) => const HomePage(),
    PasswordsPage.routeName: (context) => const PasswordsPage(),
    FavouritesPage.routeName: (context) => const FavouritesPage(),
  };
}