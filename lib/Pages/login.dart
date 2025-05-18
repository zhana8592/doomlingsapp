import 'package:flutter/material.dart';
import 'assignment_dashboard.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/tree_background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "DOOMLINGS",
              style: TextStyle(
                fontFamily: "Cinzel",
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("assets/logo.png"),
            ),
            const SizedBox(height: 30),
            _buildTextField(label: "Username"),
            const SizedBox(height: 20),
            _buildTextField(label: "Password", isPassword: true),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Navigate to second screen when tapped.
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AssignmentDashboard()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEFEFCC),
                foregroundColor: Colors.black,
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text("Enter"),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildTextField({required String label, bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        filled: true,
        fillColor: const Color(0xFFEFEFCC),
        border: const OutlineInputBorder(),
      ),
    );
  }
}