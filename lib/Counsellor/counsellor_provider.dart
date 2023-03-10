import 'package:flutter/cupertino.dart';
import 'package:raabta_fyp/Counsellor/counsellor_model.dart';
import 'package:raabta_fyp/Counsellor/counsellor_repository.dart';
import 'package:raabta_fyp/User/user_repository.dart';
import 'package:raabta_fyp/User/user_model.dart';

class CounsellorProvider with ChangeNotifier{
  final CounsellorRepository _counsellorRepository= FirebaseCounsellorRepository();

  Future<void>addCounsellor(Counsellor counsellor)async{
    await _counsellorRepository.addCounsellor(counsellor);
  }
}

