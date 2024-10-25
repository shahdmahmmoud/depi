import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController dobController = TextEditingController(); // For date of birth

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 15,
                    child: Image.asset(
                      'assets/Passport-Travel-Illustration-1.jpg',
                      fit: BoxFit.fill, // Replace with your image path
                      height: 120,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                _buildTextField(nameController, 'Name'),
                SizedBox(height: 10),
                _buildTextField(emailController, 'Email'),
                SizedBox(height: 10),
                _buildTextField(locationController, 'Location'),
                SizedBox(height: 10),
                _buildTextField(dobController, 'Date of Birth', keyboardType: TextInputType.datetime),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle save action
                    },
                    child: Text('Save'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // Button color
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                  ),
                ),
              ],
            ),
            // Stack for the Edit Icon
            Positioned(
              top: 20,
              right: 20,
              child: IconButton(
                icon: Icon(Icons.edit, color: Colors.blueAccent, size: 30),
                onPressed: () {
                  // Handle edit action (e.g., show a dialog or overlay)
                  _showEditOptions(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15), // Rounded corners
        ),
      ),
      keyboardType: keyboardType,
    );
  }

  void _showEditOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Options'),
          content: Text('Choose an option to edit.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Close'),
            ),
            // Add more options here if needed
          ],
        );
      },
    );
  }
}