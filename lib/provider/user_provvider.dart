import 'package:flutter/cupertino.dart';

import '../model/user.dart';

class UserProvider extends ChangeNotifier{
    User _user = User(
        Id: '',
        Name: '',
        Email: '',
        Password:'',
        Address: '',
        Token: '',
        Type: ''
    );

    User get user => _user;
    void SetUser(String user) {
      _user = User.fromJson(user);
    }
}