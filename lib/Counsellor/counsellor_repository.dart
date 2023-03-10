import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raabta_fyp/Counsellor/counsellor_model.dart';

abstract class CounsellorRepository{
  Future<void> addCounsellor(Counsellor counsellor);
}

class FirebaseCounsellorRepository implements CounsellorRepository{
  final db = FirebaseFirestore.instance;
  @override
  Future<void> addCounsellor(Counsellor counsellor)async{
    await db.collection('counsellors').doc(counsellor.id.toString()).set(counsellor.toJson());
  }

}