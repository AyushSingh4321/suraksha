import 'package:flutter/material.dart';
import 'package:new_project/widgets/main_drawer.dart';

class Familymembersscreen extends StatefulWidget {
  static const routeName = '/family';
  final Function? saveData;
  final List<FamilyMember> familyMembers;

  Familymembersscreen(this.saveData, this.familyMembers);

  @override
  State<Familymembersscreen> createState() => _FamilymembersscreenState();
}

class _FamilymembersscreenState extends State<Familymembersscreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  // Function to add a new family member
  void adder() {
    if (nameController.text.isNotEmpty && phoneController.text.isNotEmpty) {
      setState(() {
        widget.familyMembers.add(FamilyMember(
          nameController.text,
          phoneController.text,
        ));
        print(nameController.text);
        print(phoneController.text);
      });
      nameController.clear();
      phoneController.clear();
    } else {
      // Optionally handle empty inputs, e.g., show a warning dialog
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter both name and phone.')),
      );
    }
  }

  // Function to remove a family member
  void onRemove(FamilyMember member) {
    setState(() {
      widget.familyMembers.remove(member);
    });
  }

  Widget card(FamilyMember member) {
    return Card(
      color: Colors.white70,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(member.name),
                Text(member.phone),
              ],
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => onRemove(member),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(
          'Add Family Members',
          style: TextStyle(color: Color(0xFF000068)),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Save data functionality
              for (var i = 0; i < widget.familyMembers.length;i++)
               { print(widget.familyMembers[i].name);
                print(widget.familyMembers[i].phone);}
              if (widget.saveData != null) {
                widget.saveData!(widget.familyMembers);
              }
            },
            icon: Icon(
              Icons.save,
              color: Color(0xFF000068),
            ),
            tooltip: 'Save',
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: Color(0xFF000068)),
              ),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Contact',
                labelStyle: TextStyle(color: Color(0xFF000068)),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: adder,
              child: Text(
                'Add Family Member',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF000035),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: widget.familyMembers.length,
                itemBuilder: (ctx, index) {
                  return card(widget.familyMembers[index]);
                },
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
  String name;
  String phone;
  FamilyMember(this.name, this.phone);
}
