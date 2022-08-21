import 'package:flutter/cupertino.dart';
import 'package:twitch_yee/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    uid: '',
    username: '',
    email: '',
  );
  setUser(User user) {
    _user =
        user; // we are basiclly assigning this particular user to global user provider
    notifyListeners(); // and with this we make sure that every related class and methods updated them with this
  }

  User get user => _user;
}
