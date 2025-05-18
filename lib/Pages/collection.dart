import 'package:flutter/material.dart';
import 'stat_bar.dart'; // Make sure you import your StatBar widget

class DoomlingsScreen extends StatelessWidget {
  const DoomlingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFAED092),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text(
              "DOOMLINGS",
              style: TextStyle(
                fontSize: 36,
                fontFamily: 'AlmendraSC',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            // Row 1: Procrasto and Jampacked
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                DoomlingCard(name: 'Procrasto', imagePath: 'assets/procrasto.png'),
                DoomlingCard(name: 'Jampacked', imagePath: 'assets/jampacked.png'),
              ],
            ),
            const SizedBox(height: 20),

            // Row 2: Sir Cramsalot
            const DoomlingCard(name: 'Sir Cramsalot', imagePath: 'assets/cramsalot.png'),

            const Spacer(),

            // Player info
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/avatar.png'), // replace with your avatar path
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "@amypeng",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                          StatBar(label: 'XP', value: 170, max: 300, color: Colors.yellow),
                          SizedBox(height: 6),
                          StatBar(label: 'HP', value: 520, max: 600, color: Colors.grey),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class DoomlingCard extends StatelessWidget {
  final String name;
  final String imagePath;

  const DoomlingCard({
    super.key,
    required this.name,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 140,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            border: Border.all(color: Colors.black26),
          ),
          child: Image.asset(imagePath, fit: BoxFit.contain),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}