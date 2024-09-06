import 'package:flutter/material.dart';

class Uneasyscreen extends StatefulWidget {
  static const routeName = '/uneasy';

  @override
  State<Uneasyscreen> createState() => _UneasyscreenState();
}

class _UneasyscreenState extends State<Uneasyscreen> {
  final _form = GlobalKey<FormState>();
  String _vehicleNo = '';
  String _description = '';
  final _descriptionFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(

      appBar: AppBar(
        title: Text(
          'Uneasy',
          style: TextStyle(
            color: Color(0xFF000068),
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // Close the keyboard on tap
        },
        child:  Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                      key: _form,
                      child: Column(
                        // Changed from ListView to Column
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: 4,
                            ),
                            padding: EdgeInsets.all(8),
                            width: double.infinity,
                            child: Text(
                              'Enter the vehicle number. If following. (Optional)',
                              style: TextStyle(
                                  color: Color(0xFF000068),
                                  fontSize: 23,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 4,
                            ),
                            padding: EdgeInsets.all(8),
                            width: double.infinity,
                            child: TextFormField(
                              onFieldSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(_descriptionFocusNode);
                              },
                              textInputAction: TextInputAction.next,
                              key: const ValueKey('Vehicle No.'),
                              style: TextStyle(
                                  color: Color(0xFF000068),
                                  fontSize: 20),
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    color: Color(0xFF000068)),
                                labelText: 'Vehicle No.',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty || value.length < 10) {
                                  return 'Please enter at least 10 characters';
                                }
                                return null; // Added to indicate valid input
                              },
                              onSaved: (value) {
                                _vehicleNo = value!;
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 4,
                            ),
                            padding: EdgeInsets.all(8),
                            width: double.infinity,
                            child: Text(
                              'Please describe your situation. (Optional)',
                              style: TextStyle(
                                  color: Color(0xFF000068),
                                  fontSize: 23,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 4,
                            ),
                            padding: EdgeInsets.all(8),
                            width: double.infinity,
                            child: TextFormField(
                              minLines: 1,
                              maxLines: 5,
                              focusNode: _descriptionFocusNode,
                              key: const ValueKey('situation'),
                              style: TextStyle(
                                  color: Color(0xFF000068),
                                  fontSize: 20),
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    color: Color(0xFF000068)),
                                labelText: 'Description ',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty || value.length < 25) {
                                  return 'Should be atleast 25 characters long';
                                }
                                return null; // Added to indicate valid input
                              },
                              onSaved: (value) {
                                _description = value!;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color(0xFF000068)),
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              // Validate the form and save the data
                              if (_form.currentState!.validate()) {
                                _form.currentState!.save();
                                // Perform any further actions (like sending the data)
                              }
                            },
                            child: Text(
                              'Alert',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
