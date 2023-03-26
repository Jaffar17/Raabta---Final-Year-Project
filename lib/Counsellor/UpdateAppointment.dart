import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/counsellor/counsellor_appointments.dart';
import '../controllers/counsellor/counsellor_provider.dart';

class acceptOrReject extends StatefulWidget {
  Appointments appointment;

  acceptOrReject({Key? key, required this.appointment}) : super(key: key);

  @override
  State<acceptOrReject> createState() => _acceptOrRejectState();
}

class _acceptOrRejectState extends State<acceptOrReject> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.check_circle),
          onPressed: (){
            context.read<CounsellorProvider>().acceptAppointment(widget.appointment);
          },
          iconSize: 40,
        ),
        IconButton(
          icon: Icon(Icons.cancel),
          onPressed: (){
            context.read<CounsellorProvider>().rejectAppointment(widget.appointment);
          },
          iconSize: 40,
        ),
      ],
    );
  }
}
