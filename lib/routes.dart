import 'package:ptf/presentation/widgets/editor/password.dart';

import 'presentation/screens/home/home_page.dart';

class RoutesApp{
  static final way = {
    PasswordEditor.routeName: (context) => PasswordEditor(),
    HomePage.routeName: (context) => const HomePage(),
  };
}