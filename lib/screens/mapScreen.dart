import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class Mapscreen extends StatelessWidget {
  static const routeName = '/mapScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.all(2),
          padding: EdgeInsets.all(2),
          child: Text(
            'Safety Map',
            style: TextStyle(
              color: Color(0xFF000068),
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        backgroundColor:Colors.white,
      ),
      body: Center(
        child: Text(
          'Map Screen',
          style: TextStyle(fontSize: 40,color: Color(0xFF000068)),
        ),
      ),
    );
  }
}
