import 'package:flutter/material.dart';
import 'assignment_dashboard.dart';

class RevealPage extends StatelessWidget {
  const RevealPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFAED092),
      appBar: AppBar(
        backgroundColor: const Color(0xFFAED092),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
              Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => const AssignmentDashboard()),
    (Route<dynamic> route) => false,
  );
          },
        ),
        title: const Text(
          'Revealing...',
          style: TextStyle(
            fontFamily: 'AlmendraSC',
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Image.asset(
            'assets/revealing.gif', // Make sure the GIF is in assets
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}