import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_project/screens/familyMembersScreen.dart';
import 'package:new_project/screens/mapScreen.dart';
import 'package:new_project/screens/profileScreen.dart';
import './widgets/main_drawer.dart';
import './screens/tabs_screen.dart';
import 'package:new_project/screens/uneasyScreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './screens/authScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
List<FamilyMember> _family = [];
  Widget build(BuildContext context) {
    void _setList(List<FamilyMember> familyData) {
      setState(() {
        print('saved!');
        _family = familyData;
        for (int i = 0; i < _family.length; i++) {
          print(_family[i].name);
          print(_family[i].phone);
        }
        print('kya hua');
      });
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'New Project',
      home: Authscreen(),
      // home: HomePage(),
      routes: {
        Uneasyscreen.routeName: (ctx) => Uneasyscreen(),
        Mapscreen.routeName: (ctx) => Mapscreen(),
        HomePage.routeName: (ctx) => HomePage(),
        TabsScreen.routeName: (ctx) => TabsScreen(),
        Profilescreen.routeName: (ctx) => Profilescreen(),
        Authscreen.routeName: (ctx) => Authscreen(),
        Familymembersscreen.routeName: (ctx) =>
            Familymembersscreen(_setList, _family),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _carouselController = CarouselSliderController();
  int _currentIndex = 0;
  bool isSafetyMode = false;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    List<Widget> carouselImages = [
      Container(
        width: deviceSize.width,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFF000068), // Border color
            width: 3.0, // Border width
          ),
        ),
        child: Image.asset(
          'assets/safety1.jpg',
          fit: BoxFit.fill,
        ),
      ),
      Container(
        width: deviceSize.width,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFF000068),
            width: 3.0,
          ),
        ),
        child: Image.asset(
          'assets/safety2.jpg',
          fit: BoxFit.fill,
        ),
      ),
      Container(
        width: deviceSize.width,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFF000068),
            width: 3.0,
          ),
        ),
        child: Image.asset(
          'assets/safety3.jpg',
          fit: BoxFit.fill,
        ),
      ),
      Container(
        width: deviceSize.width,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFF000068),
            width: 3.0,
          ),
        ),
        child: Image.asset(
          'assets/safety4.jpg',
          fit: BoxFit.fill,
        ),
      ),
    ];

    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: isSafetyMode ? Colors.red[700] : Colors.white,
        title: Text(
          'Home',
          style: TextStyle(
            color: isSafetyMode ? Colors.white : Color(0xFF000068),
          ),
        ),
        actions: [
          Row(
            children: [
              Text(
                "Safety Mode",
                style: TextStyle(
                  color: isSafetyMode ? Colors.white : Colors.black,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Transform.scale(
                scale: 1.3,
                child: Container(
                  margin: EdgeInsets.all(3),
                  padding: EdgeInsets.all(4),
                  child: Switch(
                    value: isSafetyMode,
                    onChanged: (value) {
                      setState(() {
                        isSafetyMode = value; // Toggle safety mode
                      });
                    },
                    activeColor: Colors.red,
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.grey[300],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.white60,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            Container(
              color: Colors.white60,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Text(
                      "Empowering Safety, Protecting Futures.",
                      style: GoogleFonts.arsenal(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: isSafetyMode
                            ? const Color.fromARGB(255, 127, 59, 59)
                            : Color(0xFF000035),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Container(
                      color: Colors.white60,
                      child: Stack(
                        children: [
                          CarouselSlider(
                            items: carouselImages,
                            carouselController: _carouselController,
                            options: CarouselOptions(
                              height: deviceSize.height * 0.4,
                              viewportFraction: 1,
                              autoPlay: true,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentIndex = index;
                                });
                              },
                            ),
                          ),
                          Positioned(
                            left: 10,
                            top: 0,
                            bottom: 0,
                            child: IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () {
                                _carouselController.previousPage();
                              },
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 0,
                            bottom: 0,
                            child: IconButton(
                              icon: Icon(Icons.arrow_forward_ios),
                              onPressed: () {
                                _carouselController.nextPage();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'HELPLINE NUMBERS',
                    style: GoogleFonts.aleo(
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                      color: isSafetyMode ? Colors.red : Color(0xFF000035),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 350,
                    child: ListView.builder(
                      itemCount: helplineNumbers.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 15.0),
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color:
                                isSafetyMode ? Colors.red : Color(0xFF000035),
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5.0,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                helplineNumbers[index]['Help Available on']!,
                                style: GoogleFonts.belanosima(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                helplineNumbers[index]['Contact']!,
                                style: GoogleFonts.aboreto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, String>> helplineNumbers = [
  {
    'Help Available on': 'National Commission for Women Helpline',
    'Contact': '7827170170'
  },
  {
    'Help Available on': 'Central Social Welfare Board -Police Helpline',
    'Contact': '1091/ 1291, (011) 23317004'
  },
  {'Help Available on': 'Shakti Shalini', 'Contact': '10920'},
  {
    'Help Available on': 'Shakti Shalini - women\'s shelter',
    'Contact': '(011) 24373736/ 24373737'
  },
  {'Help Available on': 'SAARTHAK', 'Contact': '(011) 26853846/ 26524061'},
  {
    'Help Available on': 'All India Women\'s Conference',
    'Contact': '10921/ (011) 23389680'
  },
  {'Help Available on': 'JAGORI', 'Contact': '(011) 26692700'},
  {'Help Available on': 'JAGORI Contact', 'Contact': '+918800996640'},
  {
    'Help Available on':
        'Joint Women\'s Programme (also has branches in Bangalore, Kolkata, Chennai)',
    'Contact': '(011) 24619821'
  },
  {
    'Help Available on': 'Sakshi - violence intervention center',
    'Contact': '(0124) 2562336/ 5018873'
  },
  {
    'Help Available on': 'Saheli - a women\'s organization',
    'Contact': '(011) 24616485 (Saturdays)'
  },
  {'Help Available on': 'Nirmal Niketan', 'Contact': '(011) 27859158'},
  {'Help Available on': 'Nari Raksha Samiti', 'Contact': '(011) 23973949'},
  {
    'Help Available on':
        'RAHI - A support centre for women survivors of child sexual abuse',
    'Contact': '(011) 26238466/ 26224042, 26227647'
  },
];
