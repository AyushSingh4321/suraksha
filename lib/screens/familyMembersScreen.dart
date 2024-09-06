import 'package:flutter/material.dart';

class Familymembersscreen extends StatefulWidget {
  const Familymembersscreen({super.key});
  static const routeName = '/family';

  @override
  State<Familymembersscreen> createState() => _FamilymembersscreenState();
}

class _FamilymembersscreenState extends State<Familymembersscreen> {
  List<FamilyMember> familyMembers = [];

  // Add a new family member input fields
  void _addFamilyMember() {
    setState(() {
      familyMembers.add(FamilyMember());
    });
  }

  // Save function to print family members' details
  void _saveFamilyMembers() {
    for (var member in familyMembers) {
      print('Name: ${member.nameController.text}, Contact: ${member.contactController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Family Members',style: TextStyle(color: Color(0xFF000068)),),
        actions: [
          IconButton(
            onPressed: _saveFamilyMembers,
            icon: Icon(Icons.save,color: Color(0xFF000068),),
            tooltip: 'Save',
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: familyMembers.length,
                itemBuilder: (context, index) {
                  return FamilyMemberInput(
                    familyMember: familyMembers[index],
                    onRemove: () {
                      setState(() {
                        familyMembers.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addFamilyMember,
              child: Text(
                'Add Family Member',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF000035)),
            ),
          ],
        ),
      ),
    );
  }
}

// Family member input widget
class FamilyMemberInput extends StatelessWidget {
  final FamilyMember familyMember;
  final VoidCallback onRemove;

  FamilyMemberInput({required this.familyMember, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: familyMember.nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: Color(0xFF000068)),
              ),
            ),
            TextField(
              controller: familyMember.contactController,
              decoration: InputDecoration(
                labelText: 'Contact',
                labelStyle: TextStyle(color: Color(0xFF000068)),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: onRemove,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Model for a family member
class FamilyMember {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
}
