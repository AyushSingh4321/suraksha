import 'dart:io'; // For File handling
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_project/widgets/main_drawer.dart';

import '../pickers/user_image_picker.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});
  static const routeName = '/profile';

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  final _formKey = GlobalKey<FormState>();
  File? _userImageFile;
  

  // Controllers for text fields
  TextEditingController _nameController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _aadharController = TextEditingController();

 

  // Function to pick image from gallery
  void _pickedImage(File image) {
    _userImageFile = image;
  }
  // Save button action
  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      // Process the form data
      print('Name: ${_nameController.text}');
      print('Mobile No: ${_mobileController.text}');
      print('Aadhaar No: ${_aadharController.text}');
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Profile',style: TextStyle(color: Color(0xFF000068)),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Profile image
                UserImagePicker(_pickedImage),
                SizedBox(height: 20),

                // Name field
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Mobile Number field
                TextFormField(
                  controller: _mobileController,
                  decoration: InputDecoration(
                    labelText: 'Mobile No.',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your mobile number';
                    } else if (value.length != 10) {
                      return 'Please enter a valid 10-digit mobile number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Aadhaar Number field
                TextFormField(
                  controller: _aadharController,
                  decoration: InputDecoration(
                    labelText: 'Aadhaar No.',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Aadhaar number';
                    } else if (value.length != 12) {
                      return 'Please enter a valid 12-digit Aadhaar number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40),

                // Save button
                ElevatedButton(
                  
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF000035),),
                  onPressed: _saveForm,
                  child: Text('Save',style: TextStyle(color: Colors.white,fontSize: 22),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
