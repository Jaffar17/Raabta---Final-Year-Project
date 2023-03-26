import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raabta_fyp/Models/counsellor/counsellor_model.dart';
import 'package:raabta_fyp/Models/counsellor/counsellor_appointments.dart';

import '../../Models/user/user_model.dart';

abstract class CounsellorRepository{
  Future<void> addCounsellor(Counsellor counsellor);
  Future<Counsellor>getCounsellorById(String id);
  Future<UserModel>getUserById(String id);
  Future<void>updateAppointment(Counsellor counsellor, UserModel user);

}

class FirebaseCounsellorRepository implements CounsellorRepository {
  final db = FirebaseFirestore.instance;

  @override
  Future<void> addCounsellor(Counsellor counsellor) async {
    await db.collection('counsellors').doc(counsellor.id).set(
        counsellor.toJson());
  }

  Future<Counsellor> getCounsellorById(String id) async {
    Counsellor counsellor = Counsellor();
    await db.collection("counsellors").doc(id).get().then((
        DocumentSnapshot documentSnapshot) {
      counsellor =
          Counsellor.fromJson(documentSnapshot.data() as Map<String, dynamic>);
    });
    return counsellor;
  }

  Future<void> updateAppointment(Counsellor counsellor, UserModel user) async {
    await db.collection("counsellors").doc(counsellor!.id.toString()).update(
        counsellor.toJson());
    await db.collection("users").doc(user!.id.toString()).update(
        user.toJson());
  }
  Future<UserModel> getUserById(String id)async{
    UserModel user = UserModel();
    await db.collection("users").doc(id).get().then((
        DocumentSnapshot documentSnapshot) {
      user =
          UserModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
    });
    return user;
  }
}