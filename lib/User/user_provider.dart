import 'package:flutter/cupertino.dart';
import 'package:raabta_fyp/User/user_repository.dart';
import 'package:raabta_fyp/User/user_model.dart';

class UserProvider with ChangeNotifier{
  final UserRepository _userRepository= FirebaseUsersRepository();

  Future<void>addUser(UserModel user)async{
    await _userRepository.addUser(user);
  }
}

