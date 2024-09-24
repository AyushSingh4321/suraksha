import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_project/screens/authScreen.dart';
import 'package:new_project/screens/familyMembersScreen.dart';
import 'package:new_project/screens/profileScreen.dart';
import 'package:location/location.dart';
import 'package:new_project/screens/tabs_screen.dart';
import '../screens/uneasyScreen.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  String lat = "", lon = "";

  Future<void> _getCurrentUserLocation() async {
    // Show loading spinner
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(color: Color(0xFF000068),),
      ),
    );

    try {
      final locData = await Location().getLocation();
      setState(() {
        lat = locData.latitude.toString();
        lon = locData.longitude.toString();
      });
    } finally {
      // Close the loading spinner
      Navigator.of(context).pop();
    }
  }

  void showAlertDialog(BuildContext context) async {
    await _getCurrentUserLocation(); // Fetch the location first

    Widget okButton = TextButton(
      child: Text(
        "OK",
        style: TextStyle(color: Color.fromARGB(187, 0, 0, 0)),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Location Coordinates: $lat, $lon"),
      content: Text(
          "The details are sent to your family members, police, and locals for your assistance."),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void assault() {
    showAlertDialog(context);
  }

  Widget buildListTile(String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: const Color(0xFF000068),
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF000068)),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(color: Colors.white,
        child: Column(
          
          children: [
            Container(
              height: 240,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.bottomLeft,
              color:  Color(0xFF000035),
              child: Image.asset('assets/suraksha.png')
            ),
            SizedBox(
              height: 20,
            ),
            buildListTile('Home', Icons.home_filled, () {
              Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
            }),
            buildListTile('Profile', Icons.account_circle_rounded, () {
              Navigator.of(context).pushReplacementNamed(Profilescreen.routeName);
            }),
            buildListTile('Uneasy', Icons.woman, () {
              Navigator.of(context).pushReplacementNamed(Uneasyscreen.routeName);
            }),
            buildListTile('Emergency', FontAwesomeIcons.running, assault),
            buildListTile('Add Family Members', Icons.people, () {
              Navigator.of(context).pushReplacementNamed(Familymembersscreen.routeName);
            }),
            buildListTile('Logout', Icons.logout, () {
              Navigator.of(context).pushReplacementNamed(Authscreen.routeName);
            }),
          ],
        ),
      ),
    );
  }
}
