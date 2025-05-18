import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/forest_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "DOOMLINGS",
              style: TextStyle(
                fontFamily: "Cinzel",
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("assets/images/doomling_book.png"),
            ),
            SizedBox(height: 30),
            _buildTextField(label: "Username"),
            SizedBox(height: 20),
            _buildTextField(label: "Password", isPassword: true),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/home");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFEFEFCC),
                foregroundColor: Colors.black,
                textStyle: TextStyle(fontSize: 20),
              ),
              child: Text("Enter"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        filled: true,
        fillColor: Color(0xFFEFEFCC),
        border: OutlineInputBorder(),
      ),
    );
  }
}