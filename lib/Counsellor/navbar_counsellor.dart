import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:raabta_fyp/Counsellor/editprofile_counsellor.dart';
import 'package:raabta_fyp/Counsellor/home_counsellor.dart';
import 'package:raabta_fyp/Counsellor/inbox_counsellor.dart';

import 'appointment_counsellor.dart';
import 'notes_counsellor.dart';

class NavBarCounsellor extends StatefulWidget {
  const NavBarCounsellor({Key? key}) : super(key: key);

  @override
  State<NavBarCounsellor> createState() => _NavBarCounsellorState();
}

class _NavBarCounsellorState extends State<NavBarCounsellor> {
  int _selectedIndex = 2;

  //static const TextStyle optionStyle =
  //   TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    NotesCounsellor(),
    InboxCounsellor(),
    HomeCounsellor(),
    AppointmentCounsellor(),
    EditProfileCounsellor(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff006A6A),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.noteSticky,
                //FontAwesomeIcons.solidNoteSticky,
                size: 30,
                //color: Colors.black12,
                //color: Colors.white24,
                // color: Colors.white30,
              ),
              backgroundColor: Color(0xff006A6A),
              label: "" //"Appointments"
          ),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.solidComment,
                size: 30,
              ),
              backgroundColor: Color(0xff006A6A),
              label: "" //"Favourites"
          ),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.house,
                size: 30,
              ),
              backgroundColor: Color(0xff006A6A),
              label: "" //"Home"
          ),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.solidCalendar,
                size: 30,
              ),
              backgroundColor: Color(0xff006A6A),
              label: "" //"Messages"
          ),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.addressCard,
                size: 30,
              ),
              backgroundColor: Color(0xff006A6A),
              label: "" //"Profile"
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xffF6BD12),
        onTap: _onItemTapped,
      ),
    );
  }
}
