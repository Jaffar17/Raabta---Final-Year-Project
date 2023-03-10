import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raabta_fyp/User/user_model.dart';

abstract class UserRepository{
  Future<void> addUser(UserModel user);
}

class FirebaseUsersRepository implements UserRepository{
  final db = FirebaseFirestore.instance;

  @override
  Future<void> addUser(UserModel user)async{
    await db.collection('users').doc(user.id.toString()).set(user.toJson());
  }

}