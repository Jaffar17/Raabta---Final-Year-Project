import 'package:flutter/cupertino.dart';
import 'package:raabta_fyp/Models/counsellor/counsellor_appointments.dart';
import 'package:raabta_fyp/Models/counsellor/counsellor_model.dart';
import '../../Models/user/user_model.dart';
import 'counsellor_repository.dart';



class CounsellorProvider with ChangeNotifier{
  Counsellor counsellor = Counsellor();
  List<Appointments> confirmedAppointments=[];
  final CounsellorRepository _counsellorRepository= FirebaseCounsellorRepository();
  bool isLoading=false;

  Future<void>addCounsellor(Counsellor counsellor)async{
    await _counsellorRepository.addCounsellor(counsellor);
  }
  Future<Counsellor>getCounsellorById(String id)async{
    counsellor = await _counsellorRepository.getCounsellorById(id);
    notifyListeners();
    return counsellor;
  }
  Future<void>profileComplete(String dob, String gender, String specialisation)async {
    counsellor.dob = dob;
    counsellor.gender = gender;
    counsellor.specialisation = specialisation;
    notifyListeners();
    await _counsellorRepository.addCounsellor(counsellor);
  }

  Future<void>editProfile(String name, String email, String specialisation)async {
    counsellor.displayName = name;
    counsellor.email = email;
    counsellor.specialisation = specialisation;
    notifyListeners();
    await _counsellorRepository.addCounsellor(counsellor);
  }

  Future<void>getAppointments()async{
    counsellor=  await _counsellorRepository.getCounsellorById(counsellor.id.toString());
    notifyListeners();


  }

  void acceptAppointment(Appointments appointment)async{
    UserModel user = await _counsellorRepository.getUserById(appointment.userId.toString());
    for(var i=0; i<user.appointments!.length;i++ ){
      if(user!.appointments![i].id==appointment.id){
        user!.appointments![i].status="Confirmed";
        break;
      }
    }
    for(var i=0; i<counsellor.appointments!.length;i++ ){
      if(counsellor!.appointments![i].id==appointment.id){
        counsellor!.appointments![i].status="Confirmed";
        break;
      }
    }
    await _counsellorRepository.updateAppointment(counsellor,user);
    notifyListeners();


  }
  void rejectAppointment(Appointments appointment)async{
    UserModel user = await _counsellorRepository.getUserById(appointment.userId.toString());
    for(var i=0; i<user.appointments!.length;i++ ){
      if(user!.appointments![i].id==appointment.id){
        user!.appointments![i].status="Rejected";
        break;
      }
    }
    for(var i=0; i<counsellor.appointments!.length;i++ ){
      if(counsellor!.appointments![i].id==appointment.id){
        counsellor!.appointments![i].status="Rejected";
        break;
      }
    }
    await _counsellorRepository.updateAppointment(counsellor,user);
    notifyListeners();

  }
  Future<void> getConfirmedAppointments()async{
    counsellor.appointments!.forEach((element) {if(element.status=="Confirmed")confirmedAppointments.add(element);});
    notifyListeners();
  }
}

